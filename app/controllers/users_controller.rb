class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    # render plain: params.inspect
    @user = User.new(user_params)
    if @user.save
      cookies[:auth_token] = @user.auth_token
      redirect_to :root
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit!  
  end




end
