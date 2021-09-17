class TasksController < ApplicationController
  
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all.order(updated_at: :desc)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_path, notice: '故事已發布!'
    else
      render :new, notice: '發生錯誤' 
    end
  end

  def show
  end
  

  def edit
  end

  def update
      if @task.update(task_params)
        redirect_to tasks_path, notice: '故事已更新!'
      else
        render :edit, notice: '發生錯誤' 
      end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: '任務已刪除'
  end
  

  private

  def task_params
    params.require(:task).permit(:title, :content)
  end

  def find_task
    @task = Task.find(params[:id])
  end

end
