class WorkOrdersController < ApplicationController
  def index
    # if role is NOT 1 to 4, then go back to role's root path
    redirect_to "/admin" and return if session[:role] == 9
    # add more redirections here for 5 to 8 role_ids later on
  
    redirect_to new_session_path and return unless session[:role] #if session is not present, perform logout process to avoid unauthorized access

    # if role_id is less than 5, show the Wor System Landing Page
    if session[:role] == 1
      @work_orders = WorkOrder.where(status: "Draft", requestor_id: session[:user_id]).or(WorkOrder.where.not(status: "Draft"))
    elsif session[:role] == 2
      @work_orders = WorkOrder.where.not(status: "Draft").and(WorkOrder.where.not(status: "Cancelled", reviewed_at: nil))
    elsif session[:role] == 3
      @work_orders = WorkOrder.where.not(status: ["Under Review", "Draft"]).and(WorkOrder.where.not(status: ["Revoked", "Cancelled"], approved_at: nil))
    else
      @work_orders = WorkOrder.where(status: ["For Approval", "Approved", "Closed"])
    end

    @equipment = Equipment.all
    @users = User.all
    @page_title = "Work Order System"
  end

  def show
    if session[:role] && session[:role] > 4
      # if role is NOT 1 to 4, then go back to role's root path
      redirect_to "/admin" if session[:role] == 9
      # add more redirections here for other roles later on
    elsif session[:role] && session[:role] < 5 # if role_id is less than 5, show the Wor System Landing Page
      @work_order = WorkOrder.find_by(wor_number: params[:wor_number])
      @equipment = Equipment.find(@work_order.equipment_id)
      @priorities = ["Low", "Medium", "High"]
      @unit_names = ["Engine", "Generator", "Oil Purifier", "Booster Unit"]
      @identifiers = ["Alpha", "Bravo", "Charlie", "Delta"]
      if session[:role] == 1
        @action = "/continue"
      elsif session[:role] == 2
        @action = "/review"
      elsif session[:role] == 3
        @action = "/approve"
      else
        @action = "/close"
      end
    else #if session is not present, perform logout process to avoid unauthorized access
      redirect_to "/users/logout"
    end
  end

  def review
    @wor_number = WorkOrder.find_by(wor_number: params[:wor_number])
    @wor_number.reviewer_id = session[:user_id]
    @wor_number.reviewed_at = Time.zone.now

    if params[:approve] && @wor_number.status == "Under Review"
      @wor_number.status = "For Approval"
    elsif params[:reject]
      @wor_number.status = "Rejected"
    end

    if @wor_number.save
      redirect_to "/worsystem/#{@wor_number.wor_number}"
    else
      fail
    end
  end

  def approve
    @wor_number = WorkOrder.find_by(wor_number: params[:wor_number])
    @wor_number.approver_id = session[:user_id]
    @wor_number.approved_at = Time.zone.now

    if params[:approve] && @wor_number.status == "For Approval"
      @wor_number.status = "Approved"
    elsif params[:reject]
      @wor_number.status = "Rejected"
    end

    if @wor_number.save
      redirect_to "/worsystem/#{@wor_number.wor_number}"
    else
      fail
    end
  end

  def new
    redirect_to "/worsystem" if session[:role] < 5 && session[:role] != 1
    @equipment = Equipment.select("unit_name").group("unit_name")
    @work_order = WorkOrder.new
  end

  def continue
    if params[:revoke]
      redirect_to "/worsystem/#{params[:wor_number]}/revoke"
    elsif params[:cancel]
      redirect_to "/worsystem/#{params[:wor_number]}/cancel"
    end
    @work_order = WorkOrder.find_by(wor_number: params[:wor_number])
    @equipment = Equipment.find(@work_order.equipment_id)
    @priorities = ["Low", "Medium", "High"]
    @unit_names = ["Engine", "Generator", "Oil Purifier", "Booster Unit"]
    @identifiers = ["Alpha", "Bravo", "Charlie", "Delta"]
  end

  def create
    if params[:cancel]
      redirect_to "/worsystem/cancel"
    else
      @work_order = WorkOrder.new(params.require(:work_order).permit(:wor_number, :status, :inspected_at, :priority, :running_hours, :description))
          
      @work_order.wor_number = WorkOrder.last ? WorkOrder.last.wor_number + 1 : 4200000001
      equipment = Equipment.where(unit_name: params[:unit_name], identifier: params[:equipment_identifier]).first
      @work_order.equipment_id = equipment ? equipment.id : nil
      @work_order.requestor_id = session[:user_id].to_i
      @work_order.made_by_shortcut = session[:isShortcut]

      if params[:draft]
        @work_order.status = "Draft"
      else
        @work_order.status = "Under Review"
      end
      
      # Check if inspected_at format is valid
      if params[:work_order][:inspected_at].match?(/\A\d{2}\/\d{2}\/\d{4} \d{2}:\d{2}\z/)
        # Parse the inspected_at string and make a TimeZone object
        inspected_at_raw = Time.zone.strptime(params[:work_order][:inspected_at], "%m/%d/%Y %H:%M")  # Example format "YYYY-MM-DD HH:MM:SS"
        
        # Format the inspected_at to a standard format for Ruby
        formatted_inspected_at = inspected_at_raw.strftime("%Y-%m-%d %H:%M:%S")
        @work_order.inspected_at = formatted_inspected_at
      else
        @work_order.errors.add(:inspected_at, "has an invalid format.")
      end

      if @work_order.save
        if params[:draft]
          redirect_to "/worsystem/#{ @work_order.wor_number }/continue"
        else
          redirect_to "/worsystem/#{ @work_order.wor_number }"
        end
      else
        render :new
      end
    end
  end

  def cancel
    if params[:wor_number]
      @work_order = WorkOrder.find_by(wor_number: params[:wor_number])
      @work_order.status = "Cancelled"
      @work_order.save
      redirect_to "/worsystem/#{params[:wor_number]}"
    else
      redirect_to "/worsystem"
    end
  end

  def destroy
  end

  def revoke
    @work_order = WorkOrder.find_by(wor_number: params[:wor_number])
    @work_order.status = "Revoked"
    @work_order.save
    redirect_to "/worsystem/#{params[:wor_number]}"
  end

  def update
    if params[:cancel]
      redirect_to "/worsystem/#{params[:wor_number]}/cancel"
    else
      @work_order = WorkOrder.find_by(wor_number: params[:wor_number])
      update_params = params.require(:work_order).permit(:wor_number, :inspected_at, :priority, :running_hours, :description)
      
      equipment = Equipment.where(unit_name: params[:unit_name], identifier: params[:equipment_identifier]).first
      update_params[:equipment_id] = equipment ? equipment.id : nil
      update_params[:requestor_id] = session[:user_id].to_i

      if params[:draft]
        update_params[:status] = "Draft"
      else
        update_params[:status] = "Under Review"
      end
      
      # Check if inspected_at format is valid
      if params[:work_order][:inspected_at].match?(/\A\d{2}\/\d{2}\/\d{4} \d{2}:\d{2}\z/)
        # Parse the inspected_at string and make a TimeZone object
        inspected_at_raw = Time.zone.strptime(params[:work_order][:inspected_at], "%m/%d/%Y %H:%M")  # Example format "YYYY-MM-DD HH:MM:SS"
        
        # Format the inspected_at to a standard format for Ruby
        formatted_inspected_at = inspected_at_raw.strftime("%Y-%m-%d %H:%M:%S")
        update_params[:inspected_at] = formatted_inspected_at
      else
        @work_order.errors.add(:inspected_at, "has an invalid format.")
      end

      if @work_order.update(update_params)
        redirect_to "/worsystem/#{ @work_order.wor_number }"
      else
        render :continue
      end
    end
  end

  def close
    @work_order = WorkOrder.find_by(wor_number: params[:wor_number])
    @work_order.status = "Closed"
    @work_order.closer_id = session[:user_id].to_i
    @work_order.closed_at = Time.zone.now
    @work_order.save
    redirect_to "/worsystem/#{params[:wor_number]}"
  end
end
