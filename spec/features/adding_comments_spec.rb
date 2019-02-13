require 'rails_helper'

RSpec.feature 'Users can comment on article ideas' do
  let(:user) { create :user }
  let(:state) { create :state }
  let(:idea) { create :idea, user: user, state: state }

  before do
    login_as(user)
  end

  scenario 'with valid attributes' do
    visit idea_path(idea)
    fill_in 'What do you think?', with: "That's a great story idea!"
    click_button 'Create Comment'

    expect(page).to have_content 'Comment has been created.'
    within('#comments') do
      expect(page).to have_content "That's a great story idea!"
    end
  end

  scenario 'with invalid attributes' do
    visit idea_path(idea)
    click_button 'Create Comment'

    expect(page).to have_content "Comment hasn't been created."
  end
end
