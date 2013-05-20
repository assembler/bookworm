class Reading < ActiveRecord::Base
  RATINGS = (1..5)

  belongs_to :user
  belongs_to :book

  validates :user_id, :book_id, presence: true
  validates :rating, numericality: {
    only_integer: true,
    allow_nil: true,
    greater_than_or_equal_to: RATINGS.min,
    less_than_or_equal_to: RATINGS.max,
  }

  def username
    user.username
  end

  def rated?
    rating.present?
  end
end
