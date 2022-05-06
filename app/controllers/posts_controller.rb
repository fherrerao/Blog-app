class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = Post.where(author_id: @user.id).order(created_at: :desc)
  end

  def show
    @posts = Post.find(params[:id])
    @user_posts = @posts.most_recent_comments
  end

  def new
    @post = Post.new 
  end
  
  def create
    @post = Post.new(send_params)
    @post.author_id = current_user.id
    if @post.save
      redirect_to user_posts_path(@post.author_id)
    else
      render :new
    end
  end

  def send_params
    params.require(:post).permit(:title, :text)
  end

  private :send_params
end
