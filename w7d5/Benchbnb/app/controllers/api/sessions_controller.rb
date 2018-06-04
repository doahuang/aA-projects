class Api::SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    # debugger
    if @user
      login(@user)
      render 'api/users/show'
    else
      render json: ['invalid credentials'], status: 401
    end
  end

  def destroy
    # @user = current_user
    if current_user
      logout!
      render 'api/users/show'
    else
      render json: ['there is no current user'], status: 404
    end
  end
end
