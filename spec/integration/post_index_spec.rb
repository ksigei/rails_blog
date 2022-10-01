require 'rails_helper'
RSpec.describe 'Post index', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'Zuck',
                              photo: 'https://picsum.photos/200/300.jpg', bio: 'Teacher from Mexico.', posts_counter: 0)

    @first_post = Post.create(user: @first_user, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                              likes_counter: 0)
    @second_post = Post.create(user: @first_user, title: 'Hola', text: 'This is my second post', comments_counter: 0,
                               likes_counter: 0)
    @third_post = Post.create(user: @first_user, title: 'Honjour', text: 'This is my third post',
                              comments_counter: 0, likes_counter: 0)
    @fourth_post = Post.create(user: @first_user, title: 'Salam', text: 'This is my fourth post',
                               comments_counter: 0, likes_counter: 0)

    @first_comment = Comment.create(post: @first_post, user: @first_user, text: 'Zuck, rada!')
    @second_comment = Comment.create(post: @first_post, user: @first_user,
                                     text: 'Hey there!')
    @third_comment = Comment.create(post: @first_post, user: @first_user,
                                    text: 'Mkuu, mambo')
    @fourth_comment = Comment.create(post: @first_post, user: @first_user,
                                     text: 'fiti fiti')
    @fifth_comment = Comment.create(post: @first_post, user: @first_user,
                                    text: 'Hello Zuck!')
    @sixth_comment = Comment.create(post: @first_post, user: @first_user,
                                    text: 'Hi hola Zuck!')

    visit user_posts_path(@first_user)
  end
  describe 'post index page' do
    it 'shows the username' do
      expect(page).to have_content @first_user.name
    end

    it 'shows the number of posts each user has written' do
      expect(@first_user.posts_counter).to eq(4)
    end

    it 'shows the post\'s title' do
      expect(page).to have_content @first_post.title
      expect(page).to have_content @second_post.title
      expect(page).to have_content @third_post.title
      expect(page).to have_content @fourth_post.title
    end

    it 'shows some of the post\'s body' do
      expect(page).to have_content 'first post'
      expect(page).to have_content 'second post'
      expect(page).to have_content 'third post'
      expect(page).to have_content 'fourth post'
    end

    it 'shows the first comments on a post' do
      expect(page).to have_content @first_comment.text
    end

    it 'shows how many comments a post has' do
      expect(@first_post.comments_counter).to eq(6)
    end

    it 'shows a section for pagination if there are more posts than fit on the view' do
      expect(page).to have_content 'Read more...'
    end

    it 'When I click on a post, it redirects me to that post\'s show page' do
      click_link @first_post.title
      expect(page).to have_current_path post_path(@first_post)
    end
  end
end

# I can see the first comments on a post.
# I can see how many comments a post has.
# I can see how many likes a post has.
# I can see a section for pagination if there are more posts than fit on the view.
# When I click on a post, it redirects me to that post's show page.
