class SessionsController < ApplicationController

  @@roles = {
    1 => "Requestor",
    2 => "Reviewer",
    3 => "Approver",
    4 => "Specialist",
    5 => "Custodian",
    6 => "Finance",
    9 => "Administrator"
  }

  def index # shows login page for shortcut process (no credentials)
    render layout: 'application'
  end

  def create
    # if shortcut_user
    if (!params[:email] && !params[:password] && params[:username] && params[:role])
      @username = params[:username]
      @role_id = params[:role].to_i

      @shortcut_user = Shortcutuser.new(username: @username, role_id: @role_id)
      
      if @shortcut_user.save
        @roles = @@roles
        session[:user_id] = @shortcut_user.id
        session[:role] = @role_id
        session[:isShortcut] = true
        redirect_to worsystem_path unless @role_id > 4
        redirect_to warehouse_path if @role_id == 5
        redirect_to finance_path if @role_id == 6
        redirect_to admin_path if @role_id == 9
      else
        redirect_to "/"
      end
    elsif (params[:email] && params[:password] && params[:username] && params[:role])
      @user = User.find_by(email: params[:email])

      redirect_to login_path and return if !@user

      @roles = @@roles
      @role_id = @user.role_id

      session[:role], session[:user_id], session[:profile], session[:isShortcut] = @role_id, @user.id, "#{@user.first_name} #{@user.last_name} (#{@roles[@role_id]})", false

      redirect_to worsystem_path unless @role_id > 4
      redirect_to warehouse_path if @role_id == 5
      redirect_to finance_path if @role_id == 6
      redirect_to admin_path if @role_id == 9
    end
  end

  def destroy
    @shortcut_user = Shortcutuser.find(session[:user_id])
    @max_id = ActiveRecord::Base.connection.select_value("SELECT MAX('id') FROM shortcutusers")

    if @shortcut_user
      @shortcut_user.destroy
    end

    if @max_id
      ActiveRecord::Base.connection.reset_pk_sequence!('shortcutusers', @max_id)
    else
      ActiveRecord::Base.connection.reset_pk_sequence!('shortcutusers')
    end

    if session[:isShortcut]
      session.clear
      redirect_to root_path
      return
    end
    
    session.clear
    redirect_to login_path
  end
end
