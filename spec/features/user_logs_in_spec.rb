require 'spec_helper'

feature 'User logs in' do
  let!(:user) { create(:user) }

  scenario 'with valid credentials' do
    sign_in_with user.email, user.password
    expect(page).to have_content('Sign out')
  end

  scenario 'with invalid credentials' do
    sign_in_with user.email, 'wrong password'
    expect(page).to have_content('Sign in')
  end

  def sign_in_with(email, password)
    visit '/users/sign_in'
    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password
    click_button 'Sign in'
  end

end
