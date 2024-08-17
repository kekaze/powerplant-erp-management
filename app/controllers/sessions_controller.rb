class SessionsController < ApplicationController
  def new # shows login page for shortcut process (no credentials)
    render layout: 'application'
  end

  def process_login
    @user = User.find_by(email: params[:email])

    redirect_to login_path and return if !@user

    @roles = {
      1 => "Requestor",
      2 => "Reviewer",
      3 => "Approver",
      4 => "Specialist",
      5 => "Custodian",
      6 => "Finance",
      9 => "Administrator"
    }
    @role_id = @user.role_id

    session[:role], session[:user_id], session[:profile], session[:isShortcut] = @role_id, @user.id, "#{@user.first_name} #{@user.last_name} (#{@roles[@role_id]})", false

    redirect_to worsystem_path unless @role_id > 4
    redirect_to warehouse_path if @role_id == 5
    redirect_to finance_path if @role_id == 6
    redirect_to admin_path if @role_id == 9
  end

  def destroy
    if session[:isShortcut] 
      session.clear
      redirect_to root_path
      return
    end
    
    session.clear
    redirect_to login_path
  end
end
