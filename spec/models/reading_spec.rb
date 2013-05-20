require 'spec_helper'

describe Reading do
  describe 'validations' do
    subject { build(:reading) }
    it { should be_valid }
    it { should_not have_valid(:user_id).when(nil) }
    it { should_not have_valid(:book_id).when(nil) }
    it { should     have_valid(:rating).when(1, 2, 3, 4, 5) }
    it { should_not have_valid(:rating).when(0, 1.5, 6) }
  end

  describe '#username' do
    it 'delegates to user' do
      reader = build(:user)
      reading = build(:reading, user: reader)
      expect(reading.username).to eq(reader.username)
    end
  end

  describe '#rated?' do
    it 'checks whether there is a rating' do
      expect(build(:reading, rating: nil)).not_to be_rated
      expect(build(:reading, rating: 5)).to be_rated
    end
  end

  describe '.get(book, user)' do
    it 'finds reading' do
      reading = create(:reading)
      expect(described_class.get(reading.book, reading.user)).to eq(reading)
    end
  end
end
