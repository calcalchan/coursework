require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
      @movie = movies(:one)
      @user = users(:one)
      sign_in @user
    end

  #Test getting the home page
  test "should get home" do
    get :index
    assert_response :success
  end

  test "should get new movie" do
    get :new
    assert_response :success
  end

  #Test if the movie is created with the params and is redirected to the movie page just created
  test "should create movie" do
    assert_difference('Movie.count') do
      post :create, movie: {description: @movie.description, director: @movie.director, movie_length: @movie.movie_length, rating: @movie.rating, title: @movie.title }
    end

    assert_redirected_to movie_path(Movie.last)
  end

  test "should show movie" do
    get movie_url(@movie)
    assert_response :success
  end

  #
  test "should get edit" do
    get movie_url(@movie)
    get edit_movie_url(@movie)
    assert_response :success
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

  test "should get contact page" do
    get :contact
    assert_response :success
  end

  #Test whether a notice will be flashed when user try to send email without inputting the email
  test "should post request contact but no email" do
    post :request_contact
    assert_nil flash["You must enter an valid email address."]
    assert_response :redirect

  end

  #Test whether a valid email will be sent with notice
  test "should post request contact" do
    post :request_contact, params: {
    name: "Calvin", email: "calvin@gmail.com", message: "hello"}
      assert_not_nil flash[:notice]
      assert_response :redirect

    end


end
