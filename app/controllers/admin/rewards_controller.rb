class Admin::RewardsController < Admin::BaseController
  
  def new
    @reward = Reward.new
  end
  
  def create
    @reward = Reward.new(reward_params)
    if @reward.save
      flash[:notice] = "Reward #{@reward.name} has been created!"
      redirect_to admin_rewards_path
    else
      flash[:error] = @reward.errors.full_messages.join(", ")
    end
  end
  
  def index
    @rewards = Reward.all
  end
  
  private
  
  def reward_params
    params.require(:reward).permit(:name, :description, :cost)
  end
end