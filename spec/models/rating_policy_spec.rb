require_relative '../../app/models/rating_policy'

describe RatingPolicy do
  let(:reading) { stub() }
  let(:user) { stub(guest?: true, admin?: false) }
  subject(:policy) { described_class.new(reading, user) }


  context 'guest user' do
    before do
      user.stub(guest?: true)
    end
    it 'cannot rate the book' do
      expect(policy.can_rate?).to be_false
    end
  end

  context 'authenticated user' do
    before do
      user.stub(guest?: false)
    end

    it 'cannot rate via other people readings' do
      reading.stub(user: 'joe')
      expect(policy.can_rate?).to be_false
    end

    context 'same user' do
      let(:reading) { stub(user: user) }

      it 'cannot rate if already rated' do
        reading.stub(rated?: true)
        expect(policy.can_rate?).to be_false
      end

      it 'can rate if not unrated' do
        reading.stub(rated?: false)
        expect(policy.can_rate?).to be_true
      end
    end
  end

  context 'admin' do
    before do
      user.stub(admin?: true)
    end
    it 'can rate always' do
      expect(policy.can_rate?).to be_true
    end
  end
end
