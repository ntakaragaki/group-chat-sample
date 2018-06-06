class ChatsController < ApplicationController
  before_action :logged_in_user
  before_action :is_member
  
  def index
    @current_user = User.find(params[:session][:user_id])
    @group = Group.find(params[:group_id])
    @chats = @group.chats
    @users = @group.users
  end

  private
    # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        flash[:danger] = "ログインが必要です。"
        redirect_to login_url
      end
    end

    # Groupの参加者かどうか確認
    def is_member
      member_ids = Member.where(group_id: params[:group_id]).pluck("user_id")
      unless member_ids.include?(session[:user_id])
        flash[:danger] = "無効なページ遷移です。"
        redirect_to login_url
      end
    end
end
