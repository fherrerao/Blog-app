require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    it 'Increases the number of comments by 1' do
      user = User.new(name: 'John', posts_counter: 0, email: 'user4@example.com',
        password: '123456', confirmed_at: DateTime.now)
      user.save

      post = Post.new(title: 'Title', text: 'Text', comments_counter: 0, likes_counter: 0, author_id: user.id)
      post.save

      comment = Comment.new(author_id: user.id, post_id: post.id, text: 'Text')
      comment.save

      expect(user.comments.count).to eq(1)
    end
  end
end
