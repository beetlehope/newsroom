class Editor::ApplicationController < ApplicationController
  def index
    authorize! :manage, User
  end
end
