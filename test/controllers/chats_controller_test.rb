require 'test_helper'

class ChatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chats_index_url, params: { 'group_id' => 1, session: {'user_id' => 1} }
    assert_response :success
  end
end
