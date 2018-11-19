class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates :rating, :comment, :presence=> true
  validates :rating, numericality: { less_than_or_equal_to: 10, only_double: true }
end
