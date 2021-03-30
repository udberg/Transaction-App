require 'rails_helper'

RSpec.feature 'User Credentials Validations', type: :feature do
  scenario 'New user should enter valid credentials and Sign Up' do
    visit new_user_registration_path
    fill_in :Name, with: 'Amit'
    fill_in 'Employee Id (Must be 5 characters in length)', with: 'EMP01'
    fill_in :Email, with: 'amit@amit.com'
    fill_in 'Password (6 characters minimum)', with: 'password'
    fill_in 'Confirm Password', with: 'password'
    click_on 'SIGN UP'
  end

  scenario 'should enter valid email and password to login and visit his profile page' do
    visit new_user_session_path
    fill_in :Email, with: 'amit@amit.com'
    fill_in :Password, with: 'password'
    click_on 'Login'
    visit root_path
  end

  scenario "A user with invalid email or password can't able to login" do
    visit new_user_session_path
    fill_in :Email, with: 'abc@abc.abc'
    fill_in :Password, with: 'passphrase'
    click_on 'Login'
    expect(page).to have_content 'Log in'
  end

  scenario 'should visit the profile page and see his name' do
    visit root_path
    expect(page).to have_content 'Amit'
  end
end
