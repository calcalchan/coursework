require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @user =users(:one)
    @category =categories(:one)
    @review =reviews(:one)
  end

  #Testing if the movie is created with valid params passed through
  test "should save movie" do
    movie = Movie.new
    movie.title = "Testing 1"
    movie.description = "Testing description 1"
    movie.rating = 7
    movie.director = "Testing director"
    movie.movie_length = "Testing length"
    movie.user = @user
    movie.reviews = @review.each.all
    movie.category = @category
    movie.save
    assert movie.valid?
  end

  #Testing an invalid params when trying to create a new movie
  test "should not save movie" do
    movie = Movie.new
    movie.title = "Testing 2"
    movie.description = "Testing description 2"
    movie.rating = 9
    movie.save
    refute movie.valid?
  end

end
