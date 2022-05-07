# require 'rails_helper'

# RSpec.describe 'PostsController', type: :request do
#   describe 'Index action' do
#     before(:example) { get user_posts_path(1) }

#     it 'returns a 200 status code' do
#       expect(response).to have_http_status(200)
#     end

#     it 'render the index template' do
#       expect(response).to render_template('index')
#     end

#     it 'body should contain the title of the post' do
#       expect(response.body).to include('Here is a list of posts for a given user')
#     end
#   end

#   describe 'Show action' do
#     before(:example) { get user_post_path(1, 1) }

#     it 'returns a 200 status code' do
#       expect(response).to have_http_status(200)
#     end

#     it 'render the show template' do
#       expect(response).to render_template('show')
#     end

#     it 'body should contain the title of the post' do
#       expect(response.body).to include('Here is a post given a user')
#     end
#   end
# end
