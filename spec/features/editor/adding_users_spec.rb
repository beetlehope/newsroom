require 'rails_helper'

RSpec.feature 'Editors can add new writers' do
  let(:editor) { create :user, :editor }

  before do
    login_as(editor)
    visit '/'
    click_link 'Editor'
    click_link 'Writers'
    click_link 'New Writer'
  end

  scenario 'with correct credentials' do
    fill_in 'Email', with: 'writer@newsroom.com'
    fill_in 'Password', with: 'password'
    click_button 'Create User'

    expect(page).to have_content 'Writer has been added.'
  end

  scenario 'and make them editors' do
    fill_in 'Email', with: 'editor@newsroom.com'
    fill_in 'Password', with: 'password'
    page.select 'editor', from: "user[role]"
    click_button 'Create User'

    expect(page).to have_content 'Writer has been added.'
    expect(page).to have_content 'editor@newsroom.com'
  end
end
