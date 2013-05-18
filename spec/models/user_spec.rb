require 'spec_helper'

describe User do

  describe '#username' do
    it 'returns username portion of email address' do
      user = User.new(email: 'foo@bar.com')
      expect(user.username).to eq('foo')
    end
  end

end
