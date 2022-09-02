class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :password))
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "#{@user.username}, You have successfully signed up"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
