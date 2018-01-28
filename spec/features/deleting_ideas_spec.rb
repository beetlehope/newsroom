require 'rails_helper'

RSpec.feature "A user can delete ideas" do 

	let(:user) { FactoryBot.create(:user, email: "user_1@newsroom.com") }
	let(:user_2) { FactoryBot.create(:user, email: "user_2@newsroom.com") }
	let(:state) { FactoryBot.create(:state)}
	let!(:idea) { FactoryBot.create(:idea, name: "Trump did this", author: user, state: state) }
	let!(:idea_2) { FactoryBot.create(:idea, name: "Obama did that", author: user_2, state: state) }

	before do 
		login_as(user)
	end	

	scenario "that he came up with" do 
		visit "/"
		click_link "Trump did this"
		click_link "Delete Idea"

		expect(page).to have_content "Idea has been deleted."
		expect(page.current_url).to eq ideas_url
		expect(page).to have_no_content "Trump did this"
	end 

	scenario "but can't delete ideas added by other users" do 
		visit "/"
		click_link "Obama did that"

		expect(page).not_to have_link "Delete Idea"
	end 
end 


