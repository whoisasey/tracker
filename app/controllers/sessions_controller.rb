class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged In Successfully"
      redirect_to root_path
    else
      flash.now[:alert] = "There was something wrong with your login details"
      render 'new'
    end
  end

  def login
  end

  def welcome
  end
end
