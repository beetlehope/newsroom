require 'rails_helper'

RSpec.feature "Editors can view writers' profiles" do
  let(:editor) { create :user, :editor }
  let!(:user) { create :user, email: 'writer@newsroom.com' }
  let(:state) { create :state, name: 'Research' }
  let!(:idea) { create :idea, name: 'An awesome story idea', user: user, state: state }

  scenario 'successfully' do
    login_as(editor)
    visit '/'
    click_link "Editors' Lounge"
    click_link 'Writers'
    click_link 'writer@newsroom.com'

    expect(page).to have_content 'An awesome story idea'
    expect(page).to have_content 'writer@newsroom.com'
  end
end
