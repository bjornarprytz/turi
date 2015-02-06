require 'rails_helper'

feature "Create Account" do
	before do
		visit "/"
		
		click_link  "Sign Up"
	end
	
	scenario "can create new account" do
		fill_in "Username", with: "nu_user"
		fill_in "Email", with: "user@user.com"
		fill_in "Password", with: "password123"
		fill_in "Confirm password", with: "password123"
		
		click_button "Create Account"
		
		expect(page).to have_content("Account successfully created.")
	end
end