class TasksController < ApplicationController
  include TasksHelper

  def new
    @task = Task.new
  end

  def index
    case params[:select]
    when "タイトル"
      @tasks = Task.where(name: params[:q]).order(sort_column + ' ' + sort_direction).page(params[:page]).per(5)
    when "ステータス"
      @tasks = Task.where(status: params[:q]).order(sort_column + ' ' + sort_direction).page(params[:page]).per(5)
    else
      @tasks = Task.all.order(sort_column + ' ' + sort_direction).page(params[:page]).per(5)
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path, notice: '成功'
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = '更新しました。'
      redirect_to root_path
    else
      render :edit
    end
  end
  def destroy
    @task = Task.find(params[:id])
    flash[:notice] = '消去しました。'
    @task.destroy
    redirect_to root_path
  end
  private

  def task_params
    params.require(:task).permit(:name,:description,:deadline,:status,:priority)
  end
end
