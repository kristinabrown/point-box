class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Created a PointBox account!"
      session[:user_id] = @user.id
      redirect_to user_path
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      render :new
    end
  end
  
  def show
  end
  
  private
  
  def user_params
    params.require(:user).permit(:first_name, 
                                 :last_name, 
                                 :username, 
                                 :password, 
                                 :password_confirmation)
  end
  
end