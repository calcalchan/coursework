require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest

  def sign_in(user)
    get new_user_session_path
  end

  setup do
      @movie = movies(:one)
      @user = users(:one)
      sign_in(:one)
    end

  test "should get home" do
    get root_path
    assert_response :success
  end

  test "should get new movie" do
    sign_in(:one)
    get new_movie_path
    assert_response :success
  end

  test "should create movie" do
    assert_difference('Movie.count') do
      post movies_url, params: { movie: { description: @movie.description, director: @movie.director, movie_length: @movie.movie_length, rating: @movie.rating, title: @movie.title, category_id: @movie.category_id, image: @movie.image } }
    end

    assert_redirected_to movie_url(Movie.last)
  end

  test "should show movie" do
    movie = movies(:one)
    get movie_path(:one)
    assert_response :success
  end

  test "should get edit" do
    movie = movies(:one)
    get edit_movie_path(:one)
    assert_response :success
  end

  test "should update movie" do
    patch movie_url(@movie), params: { movie: { description: @movie.description, director: @movie.director, movie_length: @movie.movie_length, rating: @movie.rating, title: @movie.title } }
    assert_redirected_to movie_url(@movie)
  end

  test "should destroy movie" do
    assert_difference('Movie.count', -1) do
    delete :destroy, id => @movie.id
    delete movie_url(@movie)
    end

    assert_redirected_to movies_path
  end

  test "should post request contact but no email" do
    post :request_contact
      assert_response :redirect
      assert_not_empty flash [:alert]
      assert_nil flash [:notice]
  end

  test "should post request contact" do
    post :request_contact, name: "Calvin", email: "calvin@gmail.com", message: "hello"
      assert_response :redirect
      assert_nil flash [:alert]
      assert_not_empty flash [:notice]
    end
end
