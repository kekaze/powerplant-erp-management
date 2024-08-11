class SessionsController < ApplicationController
  def new # shows login page for shortcut process (no credentials)
    render layout: 'application'
  end

  def create # handler for both shortcut login and proper login
    @username = params[:username]
    @role_id = params[:role].to_i

    @roles = {
      1 => "Requestor",
      2 => "Reviewer",
      3 => "Approver",
      4 => "Specialist",
      5 => "Custodian",
      6 => "Finance",
      9 => "Administrator"
    }
    # create a new user based on the info that the user provided
    @user = Shortcutuser.new(username: @username, role_id: @role_id)

    if @user.save
      session[:role], session[:user_id], session[:username], session[:isShortcut] = @role_id, @user.id, "#{@user.username} (#{@roles[@role_id]})", 1
      flash[:notice] = ["Welcome, #{@user.username}"]
      
      redirect_to worsystem_path unless @role_id > 4
      redirect_to warehouse_path if @role_id == 5
      redirect_to finance_path if @role_id == 6
      redirect_to admin_path if @role_id == 9
    else
      render :new_session_path
    end
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
