require 'rails_helper'

RSpec.describe "admin can add on points" do
  context "to vaild user" do
    let(:admin) { User.create(first_name: "admin", 
                             last_name: "Brown",
                             username: "kbrown", 
                             role: 1, 
                             password: "password") } 
      it "should have more points" do 
        User.create(first_name: "Kristina", 
                    last_name: "Brown",
                    username: "kfbrown", 
                    role: 0, 
                    password: "password")                             
                                 
       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
       
       visit admin_users_path
  
       first(:link, "Edit Points").click

       fill_in "user[points]", with: 25
       
       click_link_or_button "Update User's Points"
       
       expect(page).to have_content("Points: 25")
     end
   end
 end
     
     
     