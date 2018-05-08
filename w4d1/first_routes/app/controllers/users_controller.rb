class UsersController < ApplicationController
  
  def index 
    users = User.all
    render json: users   
  end
  
  def create
    user = User.new(users_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: 422
    end
  end
  
  def show
    user = User.find(params[:id])
    render json: user
  end
  
  def update 
    user = User.find(params[:id])
    if user.update(users_params)
      render json: user
    else
      render user.errors.full_messages, status: 422
    end
  end
  
  def destroy 
    user = User.find(params[:id])
    user.destroy
    render json: user
  end
  
  private
  
  def users_params
    params.require(:user).permit(:username)
  end
end
