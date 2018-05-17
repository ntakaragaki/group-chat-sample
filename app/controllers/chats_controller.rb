class ChatsController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @chats = @group.chats
  end
end
