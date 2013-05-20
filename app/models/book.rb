class Book < ActiveRecord::Base
  validates :title, :isbn, presence: true
  validates :isbn, uniqueness: true

  has_many :readings

  def readings_count
    readings.count
  end
end
