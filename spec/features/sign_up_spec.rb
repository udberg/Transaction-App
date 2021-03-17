require 'rails_helper'

RSpec.describe 'SignUp', type: :feature do
  before { visit new_user_registration_path }

  it 'redirects to root path after sign up' do
    fill_in 'Name', with: 'Uduak'
    fill_in 'Email', with: 'uduak@gmail.com'
    fill_in 'Password *', with: '123456'
    fill_in 'Password confirmation *', with: '123456'
    click_button 'Sign up'

    expect(page).to have_current_path(root_path)
  end

  it 'should show errors after invalid sigup' do
    fill_in 'Name', with: ''
    fill_in 'Email', with: 'uduak@gmail.com'
    fill_in 'Password *', with: 'uduak2002'
    fill_in 'Password confirmation *', with: 'uduak2002'
    click_button 'Sign up'

    expect(page).to have_text("Name can't be blank")
  end
end
