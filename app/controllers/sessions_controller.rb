class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(login_id: params[:session][:login_id])
    if user && user.authenticate(params[:session][:password])
      # ログイン処理
      session[:user_id] = user.id
      
      redirect_to chat_group_path()
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
end
