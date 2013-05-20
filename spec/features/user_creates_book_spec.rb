require 'spec_helper'

feature 'User creats book' do
  background do
    sign_in
  end

  scenario 'with valid info' do
    visit '/books/new'
    fill_in_form_with isbn: '000-00-01', title: 'Awesome book'
    expect(page).to have_content('Awesome book')
  end

  scenario 'with invalid info' do
    visit '/books/new'
    fill_in_form_with isbn: '000-00-01', title: ''
    expect(page).to have_content("can't be blank")
  end

  def fill_in_form_with(fields)
    fill_in 'ISBN', with: fields.fetch(:isbn)
    fill_in 'Title', with: fields.fetch(:title)
    click_button 'Submit'
  end
end
