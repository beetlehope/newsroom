require 'rails_helper'

RSpec.describe IdeasController, type: :controller do

  describe "logged-out users" do
    it "can't create new ideas" do
      get :new
      
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "logged-out users" do

  	let(:user) { FactoryBot.create(:user)}
    let(:state) { FactoryBot.create(:state)}
  	let(:idea) { FactoryBot.create(:idea, name: "Trump did this", author: user, state: state)}


    it "can't delete an idea" do
      delete :destroy, params: { id: idea.id }

      expect(response).to redirect_to(new_user_session_path)
    end
  end

end
