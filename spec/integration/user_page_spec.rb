require 'rails_helper'

RSpec.describe 'User Page', type: :feature do
  describe 'User Page Index' do
    before :all do
      User.destroy_all
      User.create(id: 1, name: 'User-1', photo: 'https://www.test.com/user-image-1.png', bio: 'some1', email: 'user1@example.com',
                  password: '123456', confirmed_at: DateTime.now, posts_counter: 12)
      User.create(id: 2, name: 'User-2', photo: 'https://www.test.com/user-image-2.png', bio: 'some2', email: 'user2@example.com',
                  password: '123456', confirmed_at: DateTime.now, posts_counter: 13)
      User.create(id: 3, name: 'User-3', photo: 'https://www.test.com/user-image-3.png', bio: 'some3', email: 'user3@example.com',
                  password: '123456', confirmed_at: DateTime.now, posts_counter: 15)
    end

    before :each do
      visit users_path
    end

    it 'should have the username for all users' do
      expect(page).to have_content('User-1')
      expect(page).to have_content('User-2')
      expect(page).to have_content('User-3')
    end

    it 'should have the profile picture of each user' do
      images = page.find_all('img')
      expect(images.length).to eq(3)
      expect(page).to have_xpath("//img[contains(@src,'https://www.test.com/user-image-1.png')]")
      expect(page).to have_xpath("//img[contains(@src,'https://www.test.com/user-image-2.png')]")
      expect(page).to have_xpath("//img[contains(@src,'https://www.test.com/user-image-3.png')]")
    end

    it 'should have the number of posts for each user' do
      user1 = page.find('div', id: 'User: 1')
      user2 = page.find('div', id: 'User: 2')
      user3 = page.find('div', id: 'User: 3')

      expect(user1).to have_content('Number of posts: 12')
      expect(user2).to have_content('Number of posts: 13')
      expect(user3).to have_content('Number of posts: 15')
    end

    it "should redirect to user's page when clicked" do
      user1 = page.find('a', id: '1')

      user1.click

      expect(page).to have_current_path(user_path(id: 1))
    end
  end
end
