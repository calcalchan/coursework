require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "user sign in" do
    user = User.new
    user = users(:one)

  end
end
