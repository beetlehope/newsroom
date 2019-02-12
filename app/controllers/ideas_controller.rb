class IdeasController < ApplicationController
  before_action :authenticate, except: :index
  before_action :find_idea, only: %i[show edit update destroy]

  def index
    @ideas = Idea.where(nil)
    @ideas = @ideas.state_id(params[:state_id]) if params[:state_id].present?
  end

  def show
    @comment = @idea.comments.build
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.user = current_user

    if @idea.save
      flash[:notice] = "Article idea was added."
      redirect_to @idea
    else
      flash.now[:alert] = "Article idea hasn't been added."
      render "new"
    end
  end

  def edit; end

  def update
    if @idea.update(idea_params)
      flash[:notice] = "Article idea has been updated."
      redirect_to @idea
    else
      flash[:alert] = "Article idea hasn't been updated."
      render "edit"
     end
  end

  def destroy
    if current_user == @idea.user
      @idea.destroy
      flash[:alert] = "Article idea has been deleted."
      redirect_to ideas_path
    else
      render "You can't do that"
    end
  end

  private

  def authenticate
    redirect_to(new_user_session_path) if current_user.nil?
  end

  def find_idea
    @idea = Idea.find(params[:id])
  end

  def idea_params
    params.require(:idea).permit(:name, :description, :state_id)
  end
end
