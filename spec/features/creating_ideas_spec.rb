require 'rails_helper'

RSpec.feature "Logged-in users can create ideas for articles and set their state" do 
	let(:user) { FactoryBot.create(:user) }
	let!(:state) { FactoryBot.create(:state, name: "Research") }

	before do 
		login_as(user)
		visit "/"
		click_link "New Idea"
	end 	

	scenario "with valid attributes" do 
		fill_in "Name", with: "Oh no Trump again"
		fill_in "Description", with: "This time Trump did something truly crazy"
		select "Research", from: "State"
		click_button "Create Idea"

		expect(page).to have_content "Article idea was added."

		within("h4") do 
			expect(page).to have_content "Author: #{user.email}"
		end	

		expect(page).to have_content "Research"
	end	

	scenario "with invalid attributes" do 
		click_button "Create Idea"
		expect(page).to have_content "Article idea hasn't been added."
	end 
	

end 