require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.feature 'New Travel-log and New Group', type: :feature do
  before(:each) do
    visit new_user_registration_path
    fill_in :Name, with: 'Amit'
    fill_in 'Employee Id (Must be 5 characters in length)', with: 'EMP01'
    fill_in :Email, with: 'amit@amit.com'
    fill_in 'Password (6 characters minimum)', with: 'password'
    fill_in 'Confirm Password', with: 'password'
    click_on 'SIGN UP'

    visit new_group_path
    fill_in :Name, with: 'Test Group'
    click_on 'Create Group'

    visit root_path
    click_on 'All my Travel-logs'
    visit new_travel_path
    fill_in :Purpose, with: 'Test Purpose'
    fill_in :Source, with: 'Source1'
    fill_in :Destination, with: 'Destination1'
    fill_in 'Distance (in km)', with: '24'
    check 'Test Group'
    click_on 'Create Travel'
    click_on 'Sign out'

    visit new_user_registration_path
    fill_in :Name, with: 'John'
    fill_in 'Employee Id (Must be 5 characters in length)', with: 'EMP02'
    fill_in :Email, with: 'john@john.com'
    fill_in 'Password (6 characters minimum)', with: 'password'
    fill_in 'Confirm Password', with: 'password'
    click_on 'SIGN UP'
  end

  scenario 'should not find the log created by other user on all my travel log' do
    visit travels_path
    expect(page).to have_no_content 'Test Purpose'
  end

  scenario 'should view the group created by other user' do
    visit groups_path
    expect(page).to have_content 'Test Group'
  end

  scenario 'should view the log created by other user under associated group' do
    visit groups_path
    click_on 'Test Group'
    expect(page).to have_content 'Test Purpose'
  end
end

# rubocop:enable Metrics/BlockLength
