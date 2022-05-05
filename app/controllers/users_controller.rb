class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show 
    @posts = User.find(params[:id])    
    @user_posts = @posts.most_recent_post
  end
end
