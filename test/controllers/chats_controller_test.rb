require 'test_helper'

class ChatsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:user1)
    log_in_as(@user)
  end

  test "should get index" do
    get chats_index_url, params: { 'group_id' => 1, session: {'user_id' => 1} }
    assert_response :success
  end
end
