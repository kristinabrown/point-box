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
       
       first(:link, "delete").click
       
       expect(page).to_not have_content("thing")
     end
   end
end
     