require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  describe 'New session page' do
    before :all do
      User.create(name: 'name', photo: 'https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png',
        bio: 'some', email: 'anotheruser@example.com', password: '123456', confirmed_at: DateTime.now, posts_counter: 0)
    end

    before :each do
      visit new_user_session_path
    end

    it 'See the username and password inputs and the "Submit" button.' do
      email = find_field('Email')
      password = find_field('Password')
      login = find_button('Log in')
      expect(email).to_not be_nil
      expect(password).to_not be_nil
      expect(login).to_not be_nil
      expect(page).to have_content('Log in')
    end

    it 'should get a detailed error when click the submit button without filling data' do
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'should get a detailed error when submit after filling in the email and the password with incorrect data' do
      fill_in('Email', with: 'user@example.com')
      fill_in('Password', with: '123')
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'when submit after filling in the email and the password with correct data, I am redirected to the root page.' do
      fill_in('Email', with: 'user@example.com')
      fill_in('Password', with: '123456')
      click_button 'Log in'
      expect(page).to have_current_path(root_path)
    end
  end
end
