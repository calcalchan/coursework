require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  #Test if an invalid user can be saved
  test "invalid user" do
    user = User.new
    user.save
    refute user.valid?
  end

  #Test if a valid user will be saved
  test "save valid user" do
    user= User.new
    user.email ="calvin@gmail.com"
    user.password = "123456"
    user.save
    assert user.valid?
  end
end
