class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create destroy]

  def new
    @comment = current_user.comments.build(event_id: params[:event_id])
    respond_to do |format|
      format.js
    end
  end

  def create
    @comment = current_user.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
      @comments = @comment.event.comments.all.order(created_at: 'DESC')
        format.js
      else
        format.html { render event_path(@comment.event.id) }
      end
    end
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :event_id)
  end
end
