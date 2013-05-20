require_relative '../../app/models/reader'

describe Reader do
  let(:reading_finder) { proc { reading } }
  let(:user) { stub() }
  let(:book) { stub() }
  let(:reading) { stub() }

  subject(:reader) { Reader.new(user, reading_finder) }

  describe '#read?(book)' do
    context 'guest user' do
      let(:user) { stub(guest?: true) }
      it 'returns false' do
        expect(reader.read?(book)).to be_false
      end
    end

    context 'authenticated user' do
      let(:user) { stub(guest?: false) }

      context 'has read a book' do
        it 'returns true' do
          expect(reader.read?(book)).to be_true
        end
      end

      context 'has NOT read a book' do
        let(:reading) { nil }
        it 'returns true' do
          expect(reader.read?(book)).to be_false
        end
      end
    end
  end
end
