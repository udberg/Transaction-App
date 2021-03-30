require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.feature 'Profile validations', type: :feature do
  before(:each) do
    visit new_user_registration_path
    fill_in :Name, with: 'Amit'
    fill_in 'Employee Id (Must be 5 characters in length)', with: 'EMP01'
    fill_in :Email, with: 'amit@amit.com'
    fill_in 'Password (6 characters minimum)', with: 'password'
    fill_in 'Confirm Password', with: 'password'
    click_on 'SIGN UP'
  end

  scenario 'should visit the profile page and see his name' do
    visit root_path
    expect(page).to have_content 'Amit'
  end

  scenario 'should visit the profile page and see his employee_id' do
    visit root_path
    expect(page).to have_content 'EMP01'
  end

  scenario 'should visit the profile page and see his email' do
    visit root_path
    expect(page).to have_content 'amit@amit.com'
  end

  scenario 'should visit the profile page find link to All my travel logs' do
    visit root_path
    expect(page).to have_content 'All my Travel-logs'
  end

  scenario 'should visit the profile page find link to All my travel logs' do
    visit root_path
    expect(page).to have_content 'All my Travel-logs'
  end

  scenario 'should visit the profile page find link to All my External travel logs' do
    visit root_path
    expect(page).to have_content 'All my External Travel-logs'
  end
end

# rubocop:enable Metrics/BlockLength
