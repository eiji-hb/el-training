class TasksController < ApplicationController
  include TasksHelper

  def new
    @task = Task.new
  end

  def index
    case params[:select]
    when "タイトル"
      @tasks = current_user.tasks.where(name: params[:q]).order(sort_column + ' ' + sort_direction).page(params[:page]).per(5)
    when "ステータス"
      @tasks = current_user.tasks.where(status: params[:q]).order(sort_column + ' ' + sort_direction).page(params[:page]).per(5)
    else
      @tasks = current_user.tasks.all.order(sort_column + ' ' + sort_direction).page(params[:page]).per(5)
      # @tasks = Task.all.order(sort_column + ' ' + sort_direction).page(params[:page]).per(5)
    end
  end

  def show
    @task = current_user.tasks.find(params[:id])
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to root_path, notice: '成功'
    else
      render :new
    end
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    @task = current_user.tasks.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = '更新しました。'
      redirect_to root_path
    else
      render :edit
    end
  end
  def destroy
    @task = current_user.tasks.find(params[:id])
    flash[:notice] = '消去しました。'
    @task.destroy
    redirect_to root_path
  end
  private

  def task_params
    params.require(:task).permit(:name,:description,:deadline,:status,:priority)
  end
end
