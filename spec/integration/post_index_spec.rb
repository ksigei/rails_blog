require 'rails_helper'

# rubocop:disable Metrics/BlockLength
feature 'user post index page' do
  before :each do
    sign_up_as_kip
    visit users_url
    click_link 'Kip'
  end

  scenario 'has a profile picture for each user' do
    expect(page).to have_css('img')
  end

  scenario 'has the user\'s username' do
    expect(page).to have_content('Kip')
  end

  scenario 'has the number of posts each user has written' do
    expect(page).to have_content('0')
  end

  scenario 'has a post\'s title' do
    expect(page).to have_content('No posts yet.')
  end

  scenario 'has some of the post\'s body' do
    expect(page).to have_content('No posts yet.')
  end

  scenario 'has the first comments on a post' do
    expect(page).to have_content('No posts yet.')
  end

  scenario 'has how many comments a post has' do
    expect(page).to have_content('No posts yet.')
  end

  scenario 'has how many likes a post has' do
    expect(page).to have_content('No posts yet.')
  end

  scenario 'has a section for pagination if there are more posts than fit on the view' do
    expect(page).to have_content('No posts yet.')
  end

  scenario 'when I click a post, it redirects me to that post\'s show page' do
    click_button 'View All Posts'
    expect(page).to have_content('Posts')
  end
end

# rubocop:enable Metrics/BlockLength
