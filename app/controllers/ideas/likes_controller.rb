class Ideas::LikesController < ApplicationController
before_action :authenticate_user!
before_action :find_idea

	def create
		@idea.likes.where(user_id: current_user.id).first_or_create	
		respond_to do |format|
			format.html { redirect_to @idea }
			format.js
		end			
	end

	def destroy
		@idea.likes.where(user_id: current_user.id).destroy_all
		respond_to do |format|
			format.html { redirect_to @idea }
			format.js
		end		
	end

private

def find_idea
	@idea = Idea.find(params[:idea_id])	
end

end 	