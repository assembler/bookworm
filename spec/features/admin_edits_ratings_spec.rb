require 'spec_helper'

feature 'Admin edits ratings' do
  let!(:book) { create(:book) }
  background do
    sign_in create(:user, :admin)
  end

  scenario 'by visiting book#show page' do
    create(:reading, book: book)
    visit book_path(book)

    within '.readings' do
      expect(page).to have_button 'Rate it'
    end
  end
end
