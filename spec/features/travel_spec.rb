require 'rails_helper'

RSpec.feature 'A valid user can navigate across different sections', type: :feature do
  before(:each) do
    visit new_user_registration_path
    fill_in :Name, with: 'Amit'
    fill_in 'Employee Id (Must be 5 characters in length)', with: 'EMP01'
    fill_in :Email, with: 'amit@amit.com'
    fill_in 'Password (6 characters minimum)', with: 'password'
    fill_in 'Confirm Password', with: 'password'
    click_on 'SIGN UP'
  end

  scenario 'should able to visit All My Travel-Logs page' do
    visit root_path
    click_on 'All my Travel-logs'
    visit travels_path
    expect(page).to have_content 'Total Distance Travelled'
  end

  scenario 'should able to visit All My External Travel-Logs page' do
    visit root_path
    click_on 'All my External Travel-logs'
    visit external_path
    expect(page).to have_content 'Total Distance Travelled'
  end

  scenario 'should able to visit All Groups' do
    visit root_path
    click_on 'All Groups'
    visit external_path
    expect(page).to have_content 'All Groups'
  end
end
