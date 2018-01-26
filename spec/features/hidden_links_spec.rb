require 'rails_helper'

RSpec.feature "Users can only see appropriate links" do 

	let(:user) { FactoryBot.create(:user) }
	let(:idea) { FactoryBot.create(:idea) }

	context "logged-out users" do

		scenario "can't see New Idea link" do 
			visit "/"
			expect(page).not_to have_link "New Idea"	
		end 	
	end 	

end 



