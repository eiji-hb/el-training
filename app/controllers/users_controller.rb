class UsersController < ApplicationController
  skip_before_action :login_required
  before_action :correct_user, only: [:edit,:update,:destroy]
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: '登録しました。'
    else
      render :new
    end
  end
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'ユーザーを更新しました。'
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'ユーザーを消去しました。'
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
  def correct_user
    unless current_user.id == User.find(params[:id]).id
      flash[:alert] = "権限がありません"
      redirect_to root_path
    end
  end
end
