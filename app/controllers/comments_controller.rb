class CommentsController < ApplicationController
  before_action :find_idea

  def create
    @comment = @idea.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = 'Comment has been created.'
      redirect_to [@idea]
    else
      flash.now[:alert] = "Comment hasn't been created."
      render 'ideas/show'
    end
  end

  private

  def find_idea
    @idea = Idea.find(params[:idea_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
