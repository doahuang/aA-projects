class SessionsController < ApplicationController
  before_action :jump_show_page, only: %i(new create)
  
  def new 
    @user = User.new
    render :new
  end
  
  def create
    @user = User.find_by_credentials(
      params[:user][:email], 
      params[:user][:password]
    ) 
    if @user
      log_in_user!(@user)
      redirect_to bands_url
    else
      flash[:errors] = ['Invalid email and password']
      redirect_to new_session_url
    end
  end
  
  def destroy
    log_out!
    redirect_to new_session_url
  end
end
