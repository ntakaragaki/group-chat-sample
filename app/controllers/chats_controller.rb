class ChatsController < ApplicationController
  def index
    @group = Group.find(1)
    @chats = @group.chat
  end
end
