require 'rails_helper'

feature 'user show page' do
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

    scenario 'has the user\'s bio' do
        expect(page).to have_content('I am Kip the Grey.')
    end

    scenario 'has the user\'s first 3 posts' do
        expect(page).to have_content('No posts yet.')
    end

    scenario 'has a button that lets me view all of a user\'s posts' do
        expect(page).to have_button('View All Posts')
    end

    scenario 'when I click a user\'s post, it redirects me to that post\'s show page' do
        click_button 'View All Posts'
        expect(page).to have_content('Posts')
    end

end
