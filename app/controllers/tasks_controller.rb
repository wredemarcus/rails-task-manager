class TasksController < ApplicationController
  before_action :find_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task.save
    redirect_to task_path(@task)
  end

  def edit
  end

  def update
    @task.update(strong_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def strong_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
