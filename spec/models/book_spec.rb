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
end
