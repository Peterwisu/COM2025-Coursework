require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  #Test to check an user with null value on fields is unvalid and can not be saved
  test 'Should not save invalid user' do
    user = User.new
    user.save
    refute user.valid?
    end

  #Test to check an user with correct and type value on fields is valid and can be saved 
  test 'Should save valid user' do
    user = User.new
    user.email = 'bob@example.com'
    user.password = '12345678'
    user.save
    assert user.valid?
    end
end
