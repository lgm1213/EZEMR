module SessionsHelper
  #logs in the given user
	def log_in(user)
		session[:user_id] = user.id
	end

  #logs in the given provider
  def log_in(provider)
    session[:provider_id] = provider.id
  end
	
	# returns the current logged in user (if any are logged in at all)
	def current_user
		if (user_id = session[:user_id])
			@current_user ||= User.find_by(id: session[:user_id])
		elsif (user_id = cookies.signed[:user_id])
			user = User.find_by(id: user_id)
			if user && user.authenticated?(:remember, cookies[:remember_token])
				log_in user
				@current_user = user
			end
		end
	end

  # returns current logged in provider (if any are logged in)
  def current_provider
    if (provider_id = session[:provider_id])
      @current_provider ||= Provider.find_by(id: session[:provider_id])
    elsif (user_id = cookies.signed[:provider_id])
      user = User.find_by(id: provider_id)
      if user && user.authenticated?(:remember, cookies[:remember_token])
        log_in provider
        @current_provider = provider
      end
    end
  end

  # Returns true if a user is logged in, if not returns false
  def logged_in?
  	!current_user.nil?
    !current_provider.nil?
  end

  def forget(user)
  	user.forget
  	cookies.delete(:user_id)
  	cookies.delete(:remember_token)
  end

  def forget(provider)
    provider.forget
    cookies.delete(:provider_id)
    cookies.delete(:remember_token)
  end


  # Logs out the current user if logged in
  def log_out
  	current_user && forget(current_user)
    current_provider && forget(current_provider)
  	session.delete(:user_id)
    session.delete(:provider_id)
  	@current_user = nil
    @current_provider = nil
  end
  
  def current_user?(user)
    user == current_user
  end

  def current_user?(provider)
    provider == current_provider
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def current_provider
    if (provider_id = session[:provider_id])
      @provider_id ||= Provider.find_by(id: provider_id)
    elsif (provider = cookies.signed[:provider_id])
      provider = Provider.find_by(id: provider_id)
      if provider && provider.authenticated?(cookies[:remember_token])
        log_in provider
        @current_provider = provider
      end
    end 
  end

  #redirects to stored location or the default location
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end
  # store the url that is trying to be accessed
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
