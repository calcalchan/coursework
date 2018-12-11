require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

  #Setup for testing
  setup do
    @review = reviews(:one)
    @movie = movies(:one)
    @user = users(:one)
    sign_in @user
  end

  #Test getting the new review page
  test "should get new review" do
    get new_movie_review_url(@movie)
    assert_response :success
  end

  #Test if a valid review can be created
  test "should create review" do
    assert_difference('Review.count') do
      post movie_reviews_url(@movie), params: { review: { comment: @review.comment, rating: @review.rating } }
    end
    assert_redirected_to movie_url(@movie)
  end

  #Test if the review is displayed on the specific movie page
  test "should show review" do
    get movie_url(@movie)
    assert_response :success
  end


end
