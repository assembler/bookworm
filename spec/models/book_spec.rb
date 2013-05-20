require 'spec_helper'

describe Book do
  describe 'validations' do
    subject { build(:book) }
    it { should be_valid }
    it { should_not have_valid(:isbn).when(nil, '') }
    it { should_not have_valid(:title).when(nil, '') }
    it 'validates uniqueness of isbn' do
      existing_book = create(:book)
      build(:book, isbn: existing_book.isbn).should_not have_valid(:isbn)
    end
  end

  describe 'readings count' do
    it 'shows readings count' do
      book = create(:book)
      create_list(:reading, 2, book: book)
      expect(book.readings_count).to eq(2)
    end
  end
end
