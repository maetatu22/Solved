class CommentsController < ApplicationController
  def create
  
    @comment = Comment.new(comment_params)
    
    if @comment.save
      ActionCable.server.broadcast 'message_channel', content: @comment
      
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_text).merge(user_id: current_user.id, problem_id: params[:problem_id])
  end
end
