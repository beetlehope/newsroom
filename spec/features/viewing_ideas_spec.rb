require 'rails_helper'

RSpec.feature 'Logged-in users can view individual article ideas pages' do
  let(:user) { create :user, email: 'user@newsroom.com' }
  let(:state) { create :state }
  let!(:idea) { create :idea, name: 'Trump did that', description: "You won't believe it", user: user, state: state }

  scenario 'successfully' do
    login_as(user)
    visit '/'
    click_link 'Trump did that'

    expect(page.current_url).to eq idea_url(idea)
    expect(page).to have_content 'user@newsroom.com'
  end
end
