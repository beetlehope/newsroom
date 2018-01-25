require 'rails_helper'

RSpec.feature "Logged-in users can create ideas for articles" do 

	before do 
		login_as(FactoryBot.create(:user))
		visit "/"
		click_link "New Idea"
	end 	

	scenario "with valid attributes" do 
		fill_in "Name", with: "Oh no Trump again"
		fill_in "Description", with: "This time Trump did something truly crazy"
		click_button "Create Idea"
		expect(page).to have_content "Article idea was added."

	end	

	scenario "with invalid attributes" do 
		click_button "Create Idea"
		expect(page).to have_content "Article idea hasn't been added."
	end 
	

end 