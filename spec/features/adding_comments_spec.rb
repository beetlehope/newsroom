require 'rails_helper'

RSpec.feature "Users can comment on article ideas" do
	
	let(:user) { FactoryBot.create(:user) }
	let(:state) { FactoryBot.create(:state)}
	let(:idea) { FactoryBot.create(:idea, author: user, state: state) }

	before do 
		login_as(user)
	end

	scenario "with valid attributes" do 
		visit idea_path(idea)
		fill_in "Text", with: "That's a great story idea!"
		click_button "Create Comment"

		expect(page).to have_content "Comment has been created."
		within("#comments") do 
			expect(page).to have_content "That's a great story idea!"
		end	
	end	

	scenario "with invalid attributes" do 
		visit idea_path(idea)
		click_button "Create Comment"

		expect(page).to have_content "Comment hasn't been created."
	end	
end 	