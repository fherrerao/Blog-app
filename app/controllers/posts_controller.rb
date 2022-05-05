class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = Post.where(author_id: @user.id).order(created_at: :desc)    
  end

  def show 
    @posts = Post.find(params[:id])    
    @user_posts = @posts.most_recent_post
  end
end
