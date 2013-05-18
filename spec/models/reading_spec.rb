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
end
