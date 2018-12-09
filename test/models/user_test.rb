require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "invalid user" do
    user = User.new
    user.save
    refute user.valid?
  end

  test "save valid user" do
    user= User.new
    user.email ="calvin@gmail.com"
    user.password = "123456"
    user.save
    assert user.valid?
  end
end
