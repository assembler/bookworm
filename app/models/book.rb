class Book < ActiveRecord::Base
  validates :title, :isbn, presence: true
  validates :isbn, uniqueness: true
end
