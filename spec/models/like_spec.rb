require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'validations' do
    it 'Increases the number of likes by 1' do
      user = User.new(name: 'John', posts_counter: 0)
      user.save

      post = Post.new(title: 'Title', text: 'Text', comments_counter: 0, likes_counter: 0, author_id: user.id)
      post.save

      like = Like.new(author_id: user.id, post_id: post.id)
      like.save

      expect(user.likes.count).to eq(1)
    end
  end
end
