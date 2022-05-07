require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    before(:each) do
      @user = User.new(name: 'John', posts_counter: 0)
      @user.save
    end

    subject { Post.new(title: 'Title', text: 'Text', comments_counter: 0, likes_counter: 0, author_id: @user.id) }

    it 'It should be valid if the title is Title' do
      expect(subject).to be_valid
    end

    it 'It should not be valid if the title is nil' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'It should not be valid if the title is empty' do
      subject.title = ''
      expect(subject).to_not be_valid
    end

    it 'It should not be valid if the title is too long' do
      subject.title = 'a' * 251
      expect(subject).to_not be_valid
    end

    it 'It should be valid if the comments_counter is 0' do
      expect(subject).to be_valid
    end

    it 'It should not be valid if the comments_counter is nil' do
      subject.comments_counter = nil
      expect(subject).to_not be_valid
    end

    it 'It should not be valid if the comments_counter is negative' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'It should not be valid if the likes_counter is 0' do
      expect(subject).to be_valid
    end

    it 'It should not be valid if the likes_counter is nil' do
      subject.likes_counter = nil
      expect(subject).to_not be_valid
    end

    it 'It should not be valid if the likes_counter is negative' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end

    it 'It should not be valid if the author_id is nil' do
      subject.author_id = nil
      expect(subject).to_not be_valid
    end
  end
end
