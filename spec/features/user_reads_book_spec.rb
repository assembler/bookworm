require 'spec_helper'

feature 'User reads book' do
  let!(:book) { create(:book) }

  background do
    sign_in
  end

  scenario 'when visits unread book' do
    visit book_path(book)
    click_on 'I have read this book'
    expect(page).not_to have_link 'I have read this book'
    within '.readings' do
      expect(page).to have_content current_user.username
    end
  end

  scenario 'listing readers' do
    readings = create_list(:reading, 3, book: book)
    visit book_path(book)
    expect(page).to have_content "Read by"
    readings.each do |reading|
      expect(page).to have_content reading.user.username
    end
  end

  scenario 'read by noone' do
    visit book_path(book)
    expect(page).not_to have_content "Read by"
  end
end
