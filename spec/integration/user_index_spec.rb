require 'rails_helper'
RSpec.describe 'Users index', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'Zuck',
                              photo: 'https://picsum.photos/200/300', bio: 'Teacher from Mexico.', posts_counter: 0)
    @second_user = User.create(name: 'Kip',
                               photo: 'https://picsum.photos/200/300', bio: 'Teacher from Australia.', posts_counter: 0)
    @third_user = User.create(name: 'Jack',
                              photo: 'https://picsum.photos/200/300', bio: 'Kenyan engineer.', posts_counter: 0)
    visit users_path
  end
  describe 'user index page' do
    it 'shows the usernames of all users' do
      expect(page).to have_content('Zuck')
      expect(page).to have_content('Kip')
      expect(page).to have_content('Jack')
    end
    it 'The images links are not broken' do
      page.all('#img').each do |img|
        visit img[:src]
        page.status_code.should be 200
      end
    end
    it 'shows the profile picture for each user' do
      expect(page).to have_xpath("//img[contains(@src,'https://picsum.photos/200/300')]")
      expect(page).to have_xpath("//img[contains(@src,'https://picsum.photos/200/300')]")
      expect(page).to have_xpath("//img[contains(@src,'https://picsum.photos/200/300')]")
    end
    it 'shows the number of posts each user has written' do
      expect(page).to have_content('no posts')
    end
    it 'When I click on a user, I am redirected to that user\'s show page' do
      click_link 'Zuck'
      expect(page).to have_current_path user_path(@first_user)
    end
    it 'When I click on a user, I am redirected to that user\'s show page' do
      click_link 'Kip'
      expect(page).to have_current_path user_path(@second_user)
    end
  end
end
