class TasksController < ApplicationController
  before_action :set_task, only: [:details, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def details
    @message =
      if @task.completed
        'Well done! This task is completed.'
      else
        'This task is not completed.'
      end
  end

  def new
    @task = Task.new
  end

  def add
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
