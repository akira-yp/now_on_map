class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        @comments = Comment.where(event_id:@comment.event_id).order(created_at: 'DESC')
        format.js
      else
        format.html { render event_path(@comment.event.id) }
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :event_id)
  end
end
