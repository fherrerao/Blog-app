class PostsController < ApplicationController
  def index
    @user = User.includes(:posts, posts: [:comments, { comments: [:author] }]).find(params[:user_id])
    @post = Post.where(author_id: @user.id).order(created_at: :desc)
  end

  def show
    @posts = Post.includes(:comments, comments: [:author]).find(params[:id])
    @user_posts = @posts.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(send_params)
    @post.author_id = current_user.id
    @post.comments_counter = 0
    @post.likes_counter = 0

    if @post.save
      redirect_to user_posts_path(@post.author_id), notice: 'Post was successfully created.'
    else
      render :new
      puts 'error'
    end
  end

  def send_params
    params.require(:post).permit(:title, :text)
  end

  private :send_params
end
