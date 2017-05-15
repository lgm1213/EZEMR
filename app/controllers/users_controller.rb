class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.sent_activation_email
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
    
  end


end
