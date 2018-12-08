require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest

  #Method to let user sign up and sign in
  def sign_in(user)
    get new_user_session_path

  end

  setup do
      @movie = movies(:one)
      @user = users(:one)
      sign_in(:one)
    end

  #Test getting the home page
  test "should get home" do
    get root_path
    assert_response :success
  end

  test "should get new movie" do
    get new_movie_path
    assert_redirected_to user_session_url
  end

  #Test if the movie is created with the params and is redirected to the movie page just created
  test "should create movie" do
    assert_difference('Movie.count') do
      post movies_path @movie
    end

    assert_redirected_to movie_path(Movie.last)
  end

  test "should show movie" do
    get movie_path @movie
    assert_response :success
  end

  #
  test "should get edit" do
    get edit_movie_path @movie
    assert_redirected_to user_session_url
  end

  test "should update movie" do
    patch movie_url(@movie), params: { movie: { description: @movie.description, director: @movie.director, movie_length: @movie.movie_length, rating: @movie.rating, title: @movie.title } }
    assert_redirected_to movie_url(@movie)
    assert_redirected_to user_session_url
  end

  test "should destroy movie" do
    assert_difference('Movie.count', -1) do
    delete movie_url(@movie)
    end

    assert_redirected_to movies_path
  end

  #Test whether a notice will be flashed when user try to send email without inputting the email
  test "should post request contact but no email" do
    post :request_contact
      assert_response :redirect
      assert_not_empty flash [:alert]
      assert_nil flash [:notice]
  end

  #Test whether a valid email will be sent with notice
  test "should post request contact" do
    post :request_contact, name: "Calvin", email: "calvin@gmail.com", message: "hello"
      assert_response :redirect
      assert_nil flash [:alert]
      assert_not_empty flash [:notice]
    end


end
