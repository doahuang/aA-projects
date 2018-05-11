class UsersController < ApplicationController
  before_action :jump_show_page, only: %i(new create)
  
  def show
    render :show
  end 
  
  def new 
    @user = User.new 
    render :new
  end 
  
  def create 
    @user = User.new(user_params)
    if @user.save 
      log_in_user!(@user)
      redirect_to bands_url
    else 
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end
  
  private 
  
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
