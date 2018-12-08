require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  #Testing if the review is created with valid params passed through
  test "should save review" do
    review = Review.new
    review.rating = 6
    review.comment = "This is good"
    review.save
    assert review.valid?
  end

  #Testing an invalid params when trying to create a new review
  test "should not save review" do
    review = Review.new
    review.rating = 11
    review.comment = ""
    review.save
    refute review.valid?
  end
end
