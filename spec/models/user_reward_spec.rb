require 'rails_helper'

RSpec.describe UserReward, type: :model do
  context "is valid" do
    it "is valid with all attributes" do
      user_reward = UserReward.new(user_id: 1, reward_id: 1)
      
      expect(user_reward).to be_valid
    end
  end
  
  context "is invalid" do
    it "is invalid without a user id" do
      user_reward = UserReward.new(reward_id: 1)
      
      expect(user_reward).to_not be_valid
    end
    
    it "is invalid without a reward id" do
      user_reward = UserReward.new(user_id: 1)
      
      expect(user_reward).to_not be_valid
    end
  end
end
