require 'rails_helper'

RSpec.describe 'SignIn', type: :feature do
  before { visit new_user_session_path }

  it 'redirects to root path after sign in' do
    user = create(:user)
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_current_path(root_path)
  end

  it 'should show errors after invalid sigin' do
    fill_in 'Email', with: 'hello@gomas'
    fill_in 'Password', with: 'hello'
    click_button 'Log in'

    expect(page).to have_text('Invalid')
  end
end
