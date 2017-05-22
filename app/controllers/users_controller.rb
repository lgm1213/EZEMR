class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:destroy]
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # @user.sent_activation_email
      flash[:success] = "Welcome to EZ EHR"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(param[:id])
    if @user.update_attributes(user_params)
    #handles successful update of user info
    flash[:success] = "Updated User Info"
    redirect_to @user
    else
      render 'edit'
    end
  end
  
  def show
    @user = User.find(params[:id])
    redirect_to root_url and return unless true
  end

  def destory
    User.find(params[:id]).destroy
    flash[:success] = "User Account Deleted from System"
    redirect_to users_url
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :middle_initial, :email, :password, :password_confirmation, :gender_cd, :dob, :phone, :address, :city, :zip, :state, :ssn)
  end

  #confirm user is logged in
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in"
      redirect_to login_url
    end
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
 # confirms user is the admin user 
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end
