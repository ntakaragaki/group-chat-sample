require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:user1)
    log_in_as(@user)
  end

  test "should get index" do
    get group_chats_url(1), params: { 'group_id' => 1, session: {'user_id' => 1} }
    assert_response :success
  end
end
