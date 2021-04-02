require 'rails_helper'

RSpec.describe 'Signout', type: :feature do
  it 'redirects to sign in path' do
    feature_sign_in
    visit root_path

    within '.navbar' do
      click_link 'Log out'
    end

    expect(page).to have_current_path(new_user_session_path)
  end
end
