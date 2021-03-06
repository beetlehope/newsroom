require 'rails_helper'

RSpec.feature 'Logged-in users can create ideas for articles' do
  let(:user) { create :user }
  let(:state) { create :state }
  let!(:idea) { create :idea, name: 'Trump did that!', user: user, state: state }

  before do
    login_as(user)
    visit '/'
    click_link 'Trump did that!'
    click_link 'Edit Idea'
  end

  scenario 'successfully' do
    fill_in 'Name', with: 'Trump did this!'
    click_button 'Update'

    expect(page).to have_content 'Article idea has been updated.'
    expect(page).to have_content 'Trump did this!'
  end

  scenario 'unsuccessfully' do
    fill_in 'Name', with: ''
    click_button 'Update'

    expect(page).to have_content "Article idea hasn't been updated."
  end
end
