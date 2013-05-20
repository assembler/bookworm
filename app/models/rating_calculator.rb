class RatingCalculator
  def initialize(ratings)
    @ratings = ratings.compact
  end

  def call
    if @ratings.length.zero?
      nil
    else
      @ratings.inject(&:+) / @ratings.length.to_f
    end
  end
end
