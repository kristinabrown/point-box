class Admin::UsersController < Admin::BaseController
  
  def edit
  end
  
  def index
    @users = User.all
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find_by(username: params[:user][:username])
    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:points)
  end
  
end