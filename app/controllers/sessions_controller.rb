class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path
    else
      flash[:error] = "Unable to login."
      redirect_to login_path
    end
  end
  
  def destroy
    session.clear
    flash[:notice] = "You successfully logged out."
    redirect_to login_path
  end
end