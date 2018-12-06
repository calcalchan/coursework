require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "should save movie" do
    movie = Movie.new
    movie.name = "Movie 1"
    movie.description = "Great movie"
    movie.movie_length = "2h 30m"
    movie.director = "d"
    movie.rating = "6"
    movie.save
    assert movie.valid?
  end


end
