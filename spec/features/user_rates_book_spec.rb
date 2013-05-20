require 'spec_helper'

feature 'User rates book' do
  let!(:book) { create(:book) }

  background do
    sign_in
  end

  scenario 'by altering his reading' do
    create(:reading, book: book, user: current_user, rating: nil)
    visit book_path(book)

    within '.readings' do
      select '5', from: 'Rating'
      click_on 'Rate it'
    end

    within '.readings' do
      expect(page).to have_content('5')
      expect(page).not_to have_button 'Rate it!'
    end
  end

  scenario 'cannot rate other readings' do
    create(:reading, book: book, rating: nil)
    visit book_path(book)

    within '.readings' do
      expect(page).not_to have_button 'Rate it'
    end
  end
end
