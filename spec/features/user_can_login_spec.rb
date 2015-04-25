require 'rails_helper'

RSpec.describe "user login" do
  context "with valid attributes" do
    it "logs in" do 
      user = User.create(first_name: "kristina", 
                         last_name: "brown", 
                         username: "kbrown", 
                         password: "password")
      visit login_path
      
      fill_in "session[username]", with: "kbrown"
      fill_in "session[password]", with: "password"
      
      click_link_or_button "Go"
      
      expect(page).to have_content("Welcome, Kristina")
    end
  end
  
  context "with invalid attributes" do
    it "gets an error message" do
      user = User.create(first_name: "kristina", 
                         last_name: "brown", 
                         username: "kbrown", 
                         password: "password")
      visit login_path
      
      fill_in "session[username]", with: "kbrown"
      fill_in "session[password]", with: "pasword"
      click_link_or_button "Go"
      
      expect(page).to have_content("Unable to login.")
    end
  end
end