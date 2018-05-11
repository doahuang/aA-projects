class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?
  
  def current_user
    token = session[:session_token]
    return nil if token.nil?
    @current_user ||= User.find_by_session_token(token)
  end 
  
  def logged_in?
    !!current_user
  end 
  
  def log_in_user!(user)
    @current_user = user 
    session[:session_token] = user.reset_session_token!
  end
  
  def log_out!
    current_user.reset_session_token!
    session[:session_token] = nil 
  end
  
  def jump_show_page
    redirect_to bands_url if logged_in?
  end
  
  def require_log_in
    redirect_to new_session_url if !logged_in?
  end
end
