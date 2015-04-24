require 'rails_helper'

RSpec.describe "admin can view rewards" do
  context "with valid attributes" do
    let(:admin) { User.create(first_name: "admin", 
                           last_name: "Brown",
                           username: "kbrown", 
                           role: 1, 
                           password: "password") } 
    it "will see all the rewards" do                           
                               
     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
     
     Reward.create(name: "thing", description: "description", cost: 14)
     
     visit admin_rewards_path
     
     first(:link, "edit").click
     
     fill_in "reward[name]", with: "star"
     fill_in "reward[description]", with: "standard 5 point star" 
     fill_in "reward[cost]", with: 10

     click_link_or_button "Update Reward"
     
     expect(page).to have_content("star")
     
   end
  end
 end