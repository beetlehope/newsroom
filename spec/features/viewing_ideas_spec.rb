require 'rails_helper'

RSpec.feature "Logged-in users can view individual article ideas pages" do 

		let(:user) { FactoryBot.create(:user, email: "user@newsroom.com") }	
		let!(:idea) { FactoryBot.create(:idea, name: "Trump did that", description: "You won't believe it",author: user) }

		scenario "successfully" do
			login_as(user)
			visit "/"
			click_link "Trump did that"

			expect(page.current_url).to eq idea_url(idea)
			expect(page).to have_content "user@newsroom.com"		
		end		
end	