class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task), notice: '成功'
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update!(task_params)
    flash[:notice] = '更新しました。'
    redirect_to root_path
  end
  def destroy
    @task = Task.find(params[:id])
    flash[:notice] = '消去しました。'
    @task.destroy
    redirect_to root_path
  end
  private

  def task_params
    params.require(:task).permit(:name,:description)
  end
end
