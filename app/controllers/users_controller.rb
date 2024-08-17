class UsersController < ApplicationController
  def index
      redirect_to "/worsystem" and return if session[:role] < 5  # route guard for admin page
      # add more redirections here for other roles later on

      redirect_to new_user_path and return if !session[:role] #if session is not present, redirect to shortcut login page
    
      @roles = {
        1 => "Requestor",
        2 => "Reviewer",
        3 => "Approver",
        4 => "Specialist",
        5 => "Custodian",
        6 => "Finance",
        9 => "Administrator"
      }
      @user = User.all
      render layout: 'navbar'
  end

  def new
  end

  def create
    if (!params[:email] && !params[:password] && params[:username] && params[:role]) 
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
        session[:role], session[:user_id], session[:username], session[:isShortcut] = @role_id, @user.id, "#{@user.username} (#{@roles[@role_id]})", true
        
        redirect_to worsystem_path unless @role_id > 4
        redirect_to warehouse_path if @role_id == 5
        redirect_to finance_path if @role_id == 6
        redirect_to admin_path if @role_id == 9
      else
        redirect_to new_session_path
      end
    else
      
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.update(status: "Inactive")
    redirect_to admin_path
  end

  def edit
    @user = User.find(params[:id])
    @roles = {
      1 => "Requestor",
      2 => "Reviewer",
      3 => "Approver",
      4 => "Specialist",
      5 => "Custodian",
      6 => "Finance",
      9 => "Administrator"
    }
  end

  def update
    @user = User.find(params[:id])
    @user.update(email: params[:email], last_name: params[:last_name], first_name: params[:first_name], role_id: params[:role_id])
    
    flash[:user_errors] = @user.errors.full_messages
    redirect_to admin_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :last_name, :first_name, :role_id, :password, :password_confirmation)
  end
end

=begin
    roles = {
      1 => "Requestor",
      2 => "Reviewer",
      3 => "Approver",
      4 => "Specialist",
      5 => "Custodian",
      6 => "Finance",
      9 => "Administrator"
    }
=end


=begin
    ACCOUNTS:
      Justine Yanson - yanson.jr@saprevamped.com - supersecretseed (admin)
      Juan Tamad - tamad.jn@saprevamped.com - 123456789 (requestor)
      Admel Chester - chester.ad@saprevamped.com  - chester123 (requestor)
      Martha Plaza - plaza.m@saprevamped.com  - martha12345 (reviewer)
      Armando Miguel - miguel.arm@saprevamped.com  - armandoAko! (reviewer)
      Ursula Castellano - castellano.u@saprevamped.com  - ursul@ (approver) password has space at the end
      Jairo Soto - soto.jr@saprevamped.com  - soto123@ (approver)
      Adam Cruz - cruz.a@saprevamped.com  - niceone!@ (specialist)
      Alexander Arranz - arranz.alex@saprevamped.com  - helloworld! (specialist)
=end


# email: "admin@saprevamped.com", last_name: "Dela Cruz", first_name: "Juan", role_id: 1, password: "adminsecret123", password_confirmation: "adminsecret123"