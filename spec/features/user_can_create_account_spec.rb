require 'rails_helper'

RSpec.describe "account creation" do
  context "with valid attributes" do
    let(:user) { User.new(first_name: "Kristina", 
                             last_name: "Brown",
                             username: "kbrown", 
                             role: 0, 
                             password: "password") }
    
    it "goes to user dashboard" do
      visit new_user_path
      
      fill_in "user[first_name]", with: "Kristina"
      fill_in "user[last_name]", with: "Brown"
      fill_in "user[username]", with: "kbrown"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"  
      
      click_link_or_button "Submit"
      
      
      expect(current_path).to eq(user_path(user)) 
      expect(page).to have_content("Welcome, Kristina")
    end
  end
end        