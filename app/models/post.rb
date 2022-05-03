class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  after_save :update_posts_counter

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def most_recent_post
    comments.order(created_at: :desc).limit(5)
  end

  private :update_posts_counter
end
