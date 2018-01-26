class IdeasController < ApplicationController
  before_action :find_idea, only: [:show, :edit, :update, :destroy]

  def index
    @ideas = Idea.all
  end

  def show    
  end

  def new
  	@idea = Idea.new
  end

  def create
  	@idea = Idea.new(idea_params)
    @idea.author = current_user
  	if @idea.save 
  		flash[:notice] = "Article idea was added."
  		redirect_to @idea
  	else 
  		flash.now[:alert] = "Article idea hasn't been added."
  		render "new"
  	end			
  end

  def destroy
    if current_user == @idea.author
      @idea.destroy
      flash[:notice] = "Idea has been deleted."
      redirect_to ideas_path  
     else 
      render "You can't do that" 
    end      
  end

  
  private

  def find_idea 
    @idea = Idea.find(params[:id])
  end   

  def idea_params
	   params.require(:idea).permit(:name, :description)  	
  end
end
