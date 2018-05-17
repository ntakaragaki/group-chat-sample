class ChatsController < ApplicationController
  def index
    @current_user = User.find(session[:user_id])
    @group = Group.find(params[:group_id])
    @chats = @group.chats
    @users = @group.users
  end
end
