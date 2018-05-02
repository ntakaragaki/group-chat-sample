require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(login_id: "TestUser", password: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.login_id = "     "
    assert_not @user.valid?
  end
end
