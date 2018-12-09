require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
    include Devise::TestHelpers

  setup do
    @review = reviews(:one)
    @movie = movies(:one)
    @user = users(:one)
    sign_in @user
  end

  test "should get new review" do
    get :new
    assert_respnse :success
  end

  test "should create review" do
    assert_difference('Review.count') do
      post movie_reviews_url, params: { review: { comment: @review.comment, rating: @review.rating } }
    end

    assert_redirected_to review_url(Review.last)
  end

  test "should show review" do
    get movie_path
    assert_redirected_to user_session_url
  end


end
