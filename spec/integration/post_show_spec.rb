require 'rails_helper'

feature 'user post show page' do
  before :each do
    sign_up_as_kip
    visit users_url
    click_link 'Kip'
    click_button 'View All Posts'
  end

  scenario 'has the post\'s title' do
    expect(page).to have_content('Posts')
  end

  scenario 'has the post\'s author' do
    expect(page).to have_content('Kip')
  end

  scenario 'has the number of comments the post has' do
    expect(page).to have_content('0')
  end

  scenario 'has the number of likes the post has' do
    expect(page).to have_content('0')
  end

  scenario 'has the post\'s body' do
    expect(page).to have_content('No posts yet.')
  end

  scenario 'has the username of each commentor' do
    expect(page).to have_content('No posts yet.')
  end

  scenario 'has the comment each commentor left' do
    expect(page).to have_content('No posts yet.')
  end
end
