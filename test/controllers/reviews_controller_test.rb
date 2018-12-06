require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @review = reviews(:one)
  end

  test "should get new review" do
    get new_movie_review_path(:one)
    assert_response :success
  end

  test "should create review" do
    assert_difference('Review.count') do
      post reviews_url, params: { review: { comment: @review.comment, rating: @review.rating } }
    end

    assert_redirected_to review_url(Review.last)
  end

  test "should show review" do
    get review_url(:one)
    assert_response :success
  end


end
