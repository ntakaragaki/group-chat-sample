require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get group_chats_url(1), params: { 'group_id' => 1, session: {'user_id' => 1} }
    assert_response :success
  end
end
