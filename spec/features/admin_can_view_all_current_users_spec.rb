require 'rails_helper'

RSpec.describe "admin can add on points" do
  context "to vaild user" do
    let(:admin) { User.create(first_name: "Kristina", 
                             last_name: "Brown",
                             username: "kbrown", 
                             role: 1, 
                             password: "password") } 
      it "should have more points" do 
        User.create(first_name: "jane", 
                    last_name: "doe",
                    username: "kfbrown", 
                    role: 0, 
                    password: "password")                             
                                 
       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
       
       visit admin_users_path
       
       expect(page).to have_content("jane doe")
     end
   end
 end