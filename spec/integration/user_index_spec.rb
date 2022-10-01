require 'rails_helper'
RSpec.describe 'Users index', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'Tom',
                              photo: 'https://picsum.photos/200/300', bio: 'Teacher from Mexico.', posts_counter: 0)
    @second_user = User.create(name: 'Lilly',
                               photo: 'https://picsum.photos/200/300', bio: 'Teacher from Poland.', posts_counter: 0)
    @third_user = User.create(name: 'Mustapha',
                              photo: 'https://picsum.photos/200/300', bio: 'Teacher from Algeria.', posts_counter: 0)
    visit users_path
  end
  describe 'user index page' do
    it 'shows the usernames of all users' do
      expect(page).to have_content('Tom')
      expect(page).to have_content('Lilly')
      expect(page).to have_content('Mustapha')
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
      expect(page).to have_content('0')
    end
    it 'When I click on a user, I am redirected to that user\'s show page' do
      click_link 'Tom'
      expect(page).to have_current_path user_path(@first_user)
    end
    it 'When I click on a user, I am redirected to that user\'s show page' do
      click_link 'Lilly'
      expect(page).to have_current_path user_path(@second_user)
    end
  end
end
