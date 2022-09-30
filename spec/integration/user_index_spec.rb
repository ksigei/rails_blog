require 'rails_helper'

feature 'user index page' do
    before :each do
        sign_up_as_kip
    end

    scenario 'has a list of users' do
        visit users_url
        expect(page).to have_content('Kip')
    end

    scenario 'has a link to each user\'s show page' do
        visit users_url
        click_link 'Kip'
        expect(page).to have_content('Kip')
        expect(page).to have_content('Posts')
    end

    scenario 'has a profile picture for each user' do
        visit users_url
        expect(page).to have_css('img')
    end

    scenario 'has the number of posts each user has written' do
        visit users_url
        expect(page).to have_content('0')
    end

end





