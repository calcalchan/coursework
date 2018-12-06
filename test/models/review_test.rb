require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should save review" do
    review = Review.new
    review.raing = "5"
    review.comment = "It is good"
    review.save
    assert review.valid?
  end
end
