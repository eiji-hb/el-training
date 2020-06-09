class SessionsController < ApplicationController
  skip_before_action :login_required

  def new
    @user = User.new
  end
  def create
    @user = User.find_by(email: session_params[:email])
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'ログインしました。'
    else
      flash[:alert] = 'ログインに失敗しました。'
      render :new
    end
  end
  def destroy
    reset_session
    redirect_to root_path, notice: 'ログアウトしました。'
  end

  private
  def session_params
    params.require(:user).permit(:email,:password)
  end
end