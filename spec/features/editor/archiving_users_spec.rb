require 'rails_helper'

RSpec.feature 'Editors can archive writers' do
  let(:editor) { create :user, :editor }
  let(:user) { create(:user) }

  before do
    login_as(editor)
  end

  scenario 'successfully' do
    visit editor_user_path(user)
    click_link 'Archive Writer'

    expect(page).to have_content 'Writer has been archived.'
    expect(page).not_to have_content user.email
  end

  scenario "but can't archive themselves" do
    visit editor_user_path(editor)
    click_link 'Archive Writer'

    expect(page).to have_content "You can't archive yourself."
  end
end
