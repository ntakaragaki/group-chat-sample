require 'test_helper'

class ChatsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user1 = users(:user1)
    @user2 = users(:user2)
  end

  test "should get index" do
    log_in_as(@user1)
    get chats_index_url, params: { 'group_id' => 1, session: {'user_id' => 1} }
    assert_response :success
  end

  test "should redirect login url when not logged in" do
    get chats_index_url, params: { 'group_id' => 1 }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect login url when not group member" do
    log_in_as(@user2)
    get chats_index_url, params: { 'group_id' => 1 }
    assert_not flash.empty?
    assert_redirected_to login_url
  end
end
