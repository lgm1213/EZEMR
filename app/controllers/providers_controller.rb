class ProvidersController < ApplicationController
  before_action :set_provider, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_provider, only: [:index, :edit, :update, :destroy]
  before_action :correct_provider, only: [:edit, :update]
  before_action :admin_user, only: [:destroy]
  
  def index
    @providers = Provider.all
  end

  def new
    @provider = Provider.new
  end

  def create
    @provider = Provider.new(provider_params)
    if @provider.save
      # @user.sent_activation_email
      flash[:success] = "Welcome to EZ EHR"
      redirect_to @provider
    else
      render 'new'
    end
  end

  def edit
    @provider = Provider.find(params[:id])
  end

  def update
    @provider = Provider.find(param[:id])
    if @provider.update_attributes(provider_params)
    #handles successful update of user info
    flash[:success] = "Updated User Info"
    redirect_to @provider
    else
      render 'edit'
    end
  end
  
  def show
    @provider = Provider.find(params[:id])
    redirect_to root_url and return unless true
  end

  def destory
    Provider.find(params[:id]).destroy
    flash[:success] = "User Account Deleted from System"
    redirect_to providers_url
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_provider
    @provider = Provider.find(params[:id])
  end
  
  def provider_params
    params.require(:provider).permit(:title, :username, :first_name, :last_name, :middle_initial, :email, :password, :password_confirmation, :gender_cd, :phone, :address, :city, :zip, :state, :npi, :speciality, :fax_number)
  end

  #confirm user is logged in
  def logged_in_provider
    unless logged_in?
      store_location
      flash[:danger] = "Please log in"
      redirect_to login_url
    end
  end

  # Confirms the correct user.
  def correct_provider
    @provider = Provider.find(params[:id])
    redirect_to(root_url) unless current_provider?(@provider)
  end

end
