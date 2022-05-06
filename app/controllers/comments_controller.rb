class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(send_params)
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]
    if @comment.save  
      redirect_to user_post_path(@comment.author_id, @comment.post_id)
    else
      render :create
    end
  end

  def send_params
    params.require(:comment).permit(:text)
  end

  private :send_params
end
