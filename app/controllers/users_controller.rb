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
      flash[:errors] = @user.errors.full_messages.join(", ")
      render :new
    end
  end
  
  def show
  end
  
  def update
    reward = Reward.find(params[:user][:reward_id])
    if current_user.points >= reward.cost
      current_user.update(points: (current_user.points - reward.cost), 
                          redeemed: (current_user.redeemed + reward.cost))
      current_user.rewards << reward
      flash[:notice] = "You purchased a #{reward.name}!"
      redirect_to user_path
    else
      flash[:errors] = "You don't have enough points for that!"
      redirect_to user_path
    end
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