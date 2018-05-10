require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get chat" do
    get groups_chat_url
    assert_response :success
  end

end
