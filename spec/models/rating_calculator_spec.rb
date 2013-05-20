require_relative '../../app/models/rating_calculator'

describe RatingCalculator do
  let(:ratings) { [2, nil, 5] }

  it 'calculates the rating' do
    calculator = described_class.new [2, nil, 5]
    expect(calculator.call).to eq(3.5)
  end

  it 'returns nil if no ratings given' do
    calculator = described_class.new [nil]
    expect(calculator.call).to eq(nil)
  end
end
