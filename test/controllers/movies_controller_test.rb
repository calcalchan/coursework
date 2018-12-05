require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
      @movie = movies(:one)
    end

  test "should get home" do
    get root_url
    assert_response :sucess
  end

  test "should get new movie" do
    get new_movie_url
    assert_response :success
  end

  test "should create movie" do
    assert_difference('Movie.count') do
      post movies_url, params: { movie: { description: @movie.description, director: @movie.director, movie_length: @movie.movie_length, rating: @movie.rating, title: @movie.title, category_id: @movie.category_id, image: @movie.image } }
    end

    assert_redirected_to movie_url(Movie.last)
  end

  test "should show movie" do
    get movie_url(@movie)
    assert_response :success
  end

  test "should get edit" do
    get edit_movie_url(@movie)
    assert_response :success
  end

  test "should update movie" do
    patch movie_url(@movie), params: { movie: { description: @movie.description, director: @movie.director, movie_length: @movie.movie_length, rating: @movie.rating, title: @movie.title } }
    assert_redirected_to movie_url(@movie)
  end

  test "should destroy movie" do
    assert_difference('Movie.count', -1) do
      delete movie_url(@movie)
    end

    assert_redirected_to movies_url
  end
end
