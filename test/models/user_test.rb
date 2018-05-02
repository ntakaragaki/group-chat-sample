require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(login_id: "TestUser", password: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "ログインIDが空でないこと" do
    @user.login_id = "     "
    assert_not @user.valid?
  end

  test "ログインIDが30字以下であること" do
    @user.login_id = "a" * 30
    assert @user.valid?
    @user.login_id = "a" * 31
    assert_not @user.valid?
  end
end
