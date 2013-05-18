require 'spec_helper'

feature 'Visitor signs up' do

  scenario 'with valid email and password' do
    sign_up_with 'user@email.com', 'passwd'
    expect(page).to have_content('Sign out')
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'passwd'
    expect(page).to have_content('Sign in')
  end

  scenario 'with blank password' do
    sign_up_with 'user@email.com', ''
    expect(page).to have_content('Sign in')
  end

  def sign_up_with(email, password)
    visit '/users/sign_up'
    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password
    click_button 'Sign up'
  end

end
