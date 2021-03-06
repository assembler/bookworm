require 'spec_helper'

feature 'User lists books' do
  scenario 'with few books given' do
    books = create_list(:book, 5)

    visit books_path
    books.each do |book|
      expect(page).to have_content book.title
    end
  end

  scenario 'spread accross multiple pages' do
    books = create_list(:book, 31)

    visit books_path
    expect(page).to match_exactly 30, 'article.book'

    within 'section.books' do
      click_link 'Next'
    end
    expect(page).to match_exactly 1, 'article.book'
  end

  scenario 'searching by isbn' do
    books = create_list(:book, 2)

    visit books_path
    fill_in 'isbn', with: books.first.isbn
    click_button 'Search'

    expect(page).to have_content books.first.title
    expect(page).not_to have_content books.second.title
  end

  scenario 'suggesting to add book if not found' do
    visit books_path
    fill_in 'isbn', with: '0000-01'
    click_button 'Search'

    within 'section.books' do
      expect(page).to have_content /book not found/i
      expect(page).to have_link 'Add it?'
    end
  end

  scenario 'seeing book details' do
    book = create(:book)
    visit books_path
    within 'section.books' do
      click_link book.title
    end
    expect(page).to have_content(book.title)
  end
end
