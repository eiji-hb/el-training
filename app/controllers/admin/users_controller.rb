class Admin::UsersController < ApplicationController
  skip_before_action :login_required
  before_action :correct_user, only: [:edit,:update,:destroy]
  before_action :admin_user,only: [:index]
  before_action :no_deletion,only: [:update]
  def new
    @user = User.new
  end

  def index
    @users = User.all.order(id: :asc)
  end

  def show
    @user = User.find(params[:id])
    @tasks = @user.tasks.all.page(params[:page]).per(5)
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
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:admin)
  end
  def correct_user
    unless current_user.id == User.find(params[:id]).id || current_user.admin
      flash[:alert] = "権限がありません"
      redirect_to root_path
    end
  end
  def admin_user
    redirect_to root_path unless current_user.admin?
  end
  def no_deletion
    user = User.where(admin: true)
    if params[:user][:admin] == "general" && user.count == 1
      flash[:alert] = "管理者がいなくなります。"
      redirect_to admin_users_path
    end
  end
end
