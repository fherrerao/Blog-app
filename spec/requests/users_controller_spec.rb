require 'rails_helper'

describe 'UsersController', type: :request do
  describe 'Index action' do
    before :all do
      @user = User.create(name: 'user', email: 'abc@abc.com', bio: 'ecuatoriano', photo: 'photo.jpg', posts_counter:0)
      @user.save

      @post = Post.create(title: 'post', text: 'text', author_id: @user.id, comments_counter:0, likes_counter:0)
      @post.save    
    end

    it 'returns a 200 status code' do
      get '/'
      expect(response).to have_http_status(200)
    end

    it 'render the index template' do
      get '/'
      expect(response).to render_template(:index)
    end

    it 'body should contain the title of the post' do
      get '/users'
      expect(response.body).to include('user')
    end
  end

  describe 'Show action' do   

    it 'returns a 200 status code' do
      get '/users/2'
      expect(response).to have_http_status(200)
    end

    it 'render the show template' do
      expect(response).to render_template('show')
    end

    it 'body should contain the title of the post' do
      expect(response.body).to include('Here is a post given a user')
    end
  end
end
