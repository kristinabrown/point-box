require 'rails_helper'

RSpec.describe "user can view rewards" do
  context "with enough points" do
    let(:user) { User.create(first_name: "Kristina", 
                           last_name: "Brown",
                           username: "kbrown", 
                           role: 0, 
                           password: "password",
                           points: 20) } 
    it "is able to purchase a reward" do                       
                                 
       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
       
       Reward.create(name: "thing", description: "description", cost: 14)
       
       visit user_rewards_path
          
       click_link "thing"       
      
       expect(page).to have_button("Click to purchase")
       
       click_button "Click to purchase"

       expect(page).to have_content("You purchased a thing!")
       expect(page).to have_content("Your Rewards")
       expect(page).to have_content("6")
       
     end
   end
   
   context "with not enough points" do
     let(:user) { User.create(first_name: "Kristina", 
                            last_name: "Brown",
                            username: "kbrown", 
                            role: 1, 
                            password: "password",
                            points: 10) } 
     it "gets an error message" do                       
                                  
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        
        Reward.create(name: "thing", description: "description", cost: 14)
        
        visit user_rewards_path
           
        click_link "thing"       
       
        expect(page).to have_button("Click to purchase")
        
        click_button "Click to purchase"

        expect(page).to have_content("You don't have enough points for that!")
      end
    end
        
 end