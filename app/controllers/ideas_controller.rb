class IdeasController < ApplicationController
  def index
  end

  def new
  	@idea = Idea.new
  end

  def create
  	@idea = Idea.new(idea_params)

  	if @idea.save 
  		flash[:notice] = "Article idea was added."
  		redirect_to ideas_path
  	else 
  		flash[:alert] = "Article idea hasn't been added."
  		render "new"
  	end			
  end


  private

  def idea_params
	params.require(:idea).permit(:name, :description)  	
  end
end
