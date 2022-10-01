require 'rails_helper'
RSpec.describe 'Post show', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'Zuck',
                              photo: ' https://picsum.photos/200/300', bio: 'Teacher from Mexico.', posts_counter: 0)

    @first_post = Post.create(user: @first_user, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                              likes_counter: 0)

    @first_comment = Comment.create(post: @first_post, user: @first_user, text: 'Zuck, rada!')
    @second_comment = Comment.create(post: @first_post, user: @first_user,
                                     text: 'Hey there!')
    @third_comment = Comment.create(post: @first_post, user: @first_user,
                                    text: 'Mkuu, mambo')
    @fourth_comment = Comment.create(post: @first_post, user: @first_user,
                                     text: 'fiti fiti')

    visit user_posts_path(@first_user, @first_post)
  end

  describe 'post show page' do
    it 'shows the post title' do
      expect(page).to have_content @first_post.title
    end

    it 'shows who wrote the post' do
      expect(page).to have_content @first_post.user.name
    end

    it 'shows how many comments it has' do
      expect(@first_post.comments_counter).to eq(4)
    end

    it 'shows how many likes it has' do
      expect(@first_post.likes_counter).to eq(0)
    end

    it 'shows the post body' do
      expect(page).to have_content @first_post.text
    end

    it 'showd the username of each commentor' do
      expect(page).to have_content @first_comment.user.name
      expect(page).to have_content @second_comment.user.name
      expect(page).to have_content @third_comment.user.name
      expect(page).to have_content @fourth_comment.user.name
    end

    it 'shows the comment each commentor left' do
      expect(page).to have_content @first_comment.text
      expect(page).to have_content @second_comment.text
      expect(page).to have_content @third_comment.text
      expect(page).to have_content @fourth_comment.text
    end
  end
end

# I can see the username of each commentor.
# I can see the comment each commentor left.
