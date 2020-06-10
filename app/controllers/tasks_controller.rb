class TasksController < ApplicationController
  include TasksHelper

  def new
    @task = Task.new
    @taglist = Taglist.new
  end

  def index
    case params[:select]
    when "タイトル"
      @tasks = current_user.tasks.where(name: params[:q]).order(sort_column + ' ' + sort_direction).page(params[:page]).per(5)
    when "ステータス"
      @tasks = current_user.tasks.where(status: params[:q]).order(sort_column + ' ' + sort_direction).page(params[:page]).per(5)
    when "ラベル"
      @tasks = Task.joins(:user,:taglists).where(user: current_user, taglists:{tag_name: params[:q]}).order(sort_column + ' ' + sort_direction).page(params[:page]).per(5)
    else
      @tasks = current_user.tasks.all.order(sort_column + ' ' + sort_direction).page(params[:page]).per(5)
    end
  end

  def show
    @task = current_user.tasks.find(params[:id])
    @tags = Taglist.new
    tags = Taglist.where(id: @task.taglists)
    tag = tags.map do |t|
      array = []
      array << t.tag_name
    end
    @tag = tag.join(' ')
  end

  def create
    @task = current_user.tasks.new(task_params)
    tags = params[:taglist][:tag_name].delete(' ').split(',')
    if @task.save
      tags.each do |tag|
        @task.check_tag(tag)
      end
      redirect_to root_path, notice: '成功'
    else
      @taglist = Taglist.new
      @taglist.tag_name = params[:taglist][:tag_name]
      render :new
    end
  end

  def edit
    @task = current_user.tasks.find(params[:id])
    @taglist = Taglist.new
    tags = Taglist.where(id: @task.taglists)
    tag = tags.map do |t|
      array = []
      array << t.tag_name
    end
    @taglist.tag_name = tag.join(',')
  end

  def update
    @task = current_user.tasks.find(params[:id])
    tags = @task.taglists
    if @task.update(task_params)
      tags.destroy_all
      tags = params[:taglist][:tag_name].delete(' ').split(',')
      tags.each do |tag|
        @task.check_tag(tag)
      end
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
