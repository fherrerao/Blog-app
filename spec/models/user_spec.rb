require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    before(:each) do
      @user = User.new(name: 'John', posts_counter: 0, email: 'user1@example.com',
        password: '123456', confirmed_at: DateTime.now)
      @user.save
    end

    subject { User.new(name: 'John', posts_counter: 0, email: 'subject@example.com',
      password: '123456', confirmed_at: DateTime.now) }

    it 'It should be valid if the name is John' do
      expect(subject).to be_valid
    end

    it 'It should not be valid if the name is nil' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'It should not be valid if the name is empty' do
      subject.name = ''
      expect(subject).to_not be_valid
    end

    it 'It should be valid if the posts_counter is 0' do
      expect(subject).to be_valid
    end

    it 'It should not be valid if the posts_counter is nil' do
      subject.posts_counter = nil
      expect(subject).to_not be_valid
    end

    it 'It should not be valid if the posts_counter is negative' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end

    it 'It should not be valid if the comments_counter is 0' do
      expect(subject).to be_valid
    end
  end
end
