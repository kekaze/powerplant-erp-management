class UsersController < ApplicationController

  def index
    if session[:role] && session[:role] != 9
      redirect_to "/worsystem" if session[:role] < 5
      # add more redirections here for other roles later on
    elsif session[:role] && session[:role] == 9
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
      render layout: 'admin'
    else #if session is not present, perform logout process
      redirect_to "/users/logout"
    end
  end

  def login
    render layout: 'application'
  end

  def attempt_login
    @user = User.find_by(email: params[:email])
    @role = @user.role_id
    @roles = {
      1 => "Requestor",
      2 => "Reviewer",
      3 => "Approver",
      4 => "Specialist",
      5 => "Custodian",
      6 => "Finance",
      9 => "Administrator"
    }
    if @user && @user.authenticate(params[:password]) #authenticate belong to the bcrypt's `has_secure_password` feature
      session[:role], session[:user_id], session[:username] = @role, @user.id, "#{@user.first_name} #{@user.last_name} (#{@roles[@role]})"
      flash[:notice] = ["Welcome, #{@user.first_name}"]
      
      redirect_to worsystem_path unless @role > 4
      redirect_to warehouse_path if @role == 5
      redirect_to finance_path if @role == 6
      redirect_to admin_path if @role == 9
    else
      flash[:notice] = ["Failed to login/signup"]
      flash[:user_errors] = @user.errors.full_messages
      redirect_to login_path
    end
  end

  def new
  end

  def create
    @user = User.new(params.require(:user).permit(:email, :last_name, :first_name, :role_id, :password, :password_comfirmation, :status))
    @user.status = "Active"
    if @user.save
      redirect_to admin_path
    else
      render :new
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

  def logout
    session.clear
    redirect_to login_path
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