class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :require_log_in, :require_log_out


  def my_cat?
    redirect_to cat_url(Cat.find(params[:id])) if !current_user.cats.map(&:id).include?(params[:id].to_i)
  end

  def require_log_in
    redirect_to cats_url if logged_in?
  end

  def require_log_out
    redirect_to new_session_url if !logged_in?
  end

  def login!(user)
    @current_user = user
    session[:session_token] = user.reset_session_token!
    # ######
    UserSession.create!(user_id: user.id,
       token_of_session: session[:session_token])
  end

  def logout!
    current_user.reset_session_token!
    # #####
    UserSession
      .find_by(token_of_session: session[:session_token])
      .destroy
    # ####
    session[:session_token] = nil
  end

  def current_user
    return nil if session[:session_token].nil?
    # @current_user ||= User.find_by(session_token: session[:session_token])
    @current_user ||= UserSession
                        .find_by(token_of_session: session[:session_token])
                        .user
  end

  def logged_in?
    !!current_user
  end

end
