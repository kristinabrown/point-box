require 'rails_helper'

RSpec.describe "admin can create rewards" do
  context "with valid attributes" do
    let(:admin) { User.create(first_name: "admin", 
                             last_name: "Brown",
                             username: "kbrown", 
                             role: 1, 
                             password: "password") } 
      it "will be a reward" do                           
                                 
       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
       
       visit new_admin_reward_path
       
       fill_in "reward[name]", with: "star"
       fill_in "reward[description]", with: "standard 5 point star" 
       fill_in "reward[cost]", with: 10
       
       click_link_or_button "Create Reward"
       
       expect(page).to have_content("star")
     end
   end
 end