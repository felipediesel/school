require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should validate name" do
    user = User.new
    assert_not user.valid?
    assert_includes user.errors.keys, :name, "should require a name for user"
  end

  test "should remember_me be tru by default" do
    user = User.new
    assert user.remember_me
  end

end
