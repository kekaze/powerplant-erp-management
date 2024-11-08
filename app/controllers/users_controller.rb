class UsersController < ApplicationController

  @@roles = {
    1 => "Requestor",
    2 => "Reviewer",
    3 => "Approver",
    4 => "Specialist",
    5 => "Custodian",
    6 => "Finance",
    9 => "Administrator"
  }

  def index
    redirect_to "/" and return if session[:role] == nil
    redirect_to "/worsystem" and return if session[:role] < 5  # route guard for admin page

    ###### TODO: add more redirections here for other roles later on

    redirect_to new_user_path and return if !session[:role] #if session is not present, redirect to shortcut login page
    
    @roles = @@roles
    @user = User.all
    @page_title = "Admin"
  end

  def new
  end

  def create
    @new_user = User.new(params.require(:user).permit(:role_id, :email, :last_name, :first_name, :password, :password_confirmation))
    if @new_user.save
      respond_to do |format|
        format.html { redirect_to admin_path, notice: 'User was successfully created.' }
        format.js
      end
    else
      format.js
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.update(status: false)
    redirect_to admin_path
  end

  def edit
    @user = User.find(params[:id])
    @roles = @@roles
  end

  def update
    @user = User.find(params[:id])
    @user.update(params.require(:user).permit(:email, :last_name, :first_name, :role_id))
    
    flash[:user_errors] = @user.errors.full_messages
    print(flash[:user_errors])
    redirect_to admin_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :last_name, :first_name, :role_id, :password, :password_confirmation)
  end
end