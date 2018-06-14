class SessionsController < ApplicationController
  def new
  end

  def create
    # User_id=1をAPI用に予約したため、このIDだけはログインできないようにする
    if params[:session][:login_id] == 1
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end

    user = User.find_by(login_id: params[:session][:login_id])
    if user && user.authenticate(params[:session][:password])
      # ログイン処理
      session[:user_id] = user.id
      redirect_to group_chats_url(user.groups.first.id, session: user_params)
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

    def user_params
      params.require(:session).permit(:login_id, :user_id)
    end

    # 現在のユーザーをログアウトする
    def log_out
      session.delete(:user_id)
      @current_user = nil
    end
end
