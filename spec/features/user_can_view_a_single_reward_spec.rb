require 'rails_helper'

RSpec.describe "user can view rewards" do
  context "with valid attributes" do
    let(:user) { User.create(first_name: "admin", 
                           last_name: "Brown",
                           username: "kbrown", 
                           role: 1, 
                           password: "password") } 
    it "sees a list of all available rewards" do                       
                                 
       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
       
       Reward.create(name: "thing", description: "description", cost: 14)
       
       visit user_rewards_path
       
       click_link "thing"       
       
       expect(page).to have_button("Click to purchase")
     end
   end
 end
 