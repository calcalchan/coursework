class Review < ApplicationRecord
  #Associations
  belongs_to :user
  belongs_to :movie
  #Validations
  validates :rating, :comment, :presence=> true
  validates :rating, numericality: { less_than_or_equal_to: 10, only_double: true }
end
