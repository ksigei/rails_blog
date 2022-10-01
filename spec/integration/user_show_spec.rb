require 'rails_helper'
RSpec.describe 'User show', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'Tom',
                              photo: 'https://picsum.photos/200/300', bio: 'Teacher from Mexico.', posts_counter: 0)
    @first_post = Post.create(user: @first_user, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                              likes_counter: 0)
    @second_post = Post.create(user: @first_user, title: 'Hola', text: 'This is my second post', comments_counter: 0,
                               likes_counter: 0)
    @third_post = Post.create(user: @first_user, title: 'Honjour', text: 'This is my third post',
                              comments_counter: 0, likes_counter: 0)
    @fourth_post = Post.create(user: @first_user, title: 'Salam', text: 'This is my fourth post',
                               comments_counter: 0, likes_counter: 0)

    visit user_path(@first_user)
  end

  describe 'user show page' do
    it 'shows the user profile picture' do
      expect(page).to have_xpath("//img[contains(@src,'https://picsum.photos/200/300')]")
    end

    it 'shows the username' do
      expect(page).to have_content @first_user.name
    end

    it 'shows the number of posts each user has written' do
      expect(@first_user.posts_counter).to eq(4)
    end

    it 'shows the user bio' do
      expect(page).to have_content @first_user.bio
    end

    it 'shows the user\'s first 3 posts' do
      expect(page).to have_content @first_post.title
      expect(page).to have_content @second_post.title
      expect(page).to have_content @third_post.title
    end

    it 'shows the button that lets me view all of a user\'s posts' do
      expect(page).to have_link 'See all posts'
    end

    it 'When I click on a user post, it redirects me to that post\'s show page' do
      click_link 'Hello'
      expect(page).to have_current_path user_post_path(@first_user, @first_post)
    end

    it 'When I click to see all posts, it redirects me to the user\'s post\'s index page' do
      click_link 'See all posts'
      expect(page).to have_current_path user_posts_path(@first_user)
    end
  end
end
