require 'rails_helper'
require 'spec_helper'


feature 'the signup process' do
  
  scenario 'has a new user page' do 
    visit new_user_url
    expect(page).to have_content 'Sign Up'
  end

  feature 'signing up a user' do
    
    scenario 'shows username on the homepage after signup' do
      visit new_user_url
      fill_in 'username', with: 'mrs anderson'
      fill_in 'password', with: 'red pill'
      click_on 'Sign Up'
      expect(current_url).to eq(users_url)
      expect(page).to have_content 'mrs anderson'
    end
    
  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login' do
    visit new_session_url
    fill_in 'username', with: 'mr anderson'
    fill_in 'password', with: 'red pill'
    
    click_on 'Sign In'
    
    expect(current_url).to eq(users_url)
    expect(page).to have_content 'mr anderson'
  end
end

feature 'logging out' do
  scenario 'begins with a logged out state' do 
    visit users_url
    expect(page).to have_content 'Sign In'
    save_and_open_page
    expect(current_url).to eq(new_session_url)
  end 

  scenario 'doesn\'t show username on the homepage after logout' do 
    visit new_session_url
    fill_in 'username', with: 'mr anderson'
    fill_in 'password', with: 'red pill'
    click_on 'Sign In'
    click_on 'Sign Out'
    expect(current_url).to eq(new_session_url)
    expect(page).not_to have_content 'mr anderson'
  end 
end