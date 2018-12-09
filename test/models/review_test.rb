require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @user =users(:one)
    @movie =movies(:one)
  end

  #Testing if the review is created with valid params passed through
  test "should save review" do
    review = Review.new
    review.rating = 6
    review.comment = "This is good"
    review.user = @user
    review.movie = @movie
    review.save
    assert review.valid?
  end

  #Testing an invalid params when trying to create a new review
  test "should not save review" do
    review = Review.new
    review.rating = 11
    review.comment = ""
    review.user = @user
    review.save
    refute review.valid?
  end
end
