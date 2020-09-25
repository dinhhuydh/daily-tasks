class TasksController < ApplicationController
  before_action :authenticate_user
  before_action :set_task, only: [:update, :destroy]

  def index
    if params[:all].present?
      @tasks = current_user.tasks
    else
      @tasks = current_user.tasks.not_closed
    end
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    @task.save
  end

  def update
    action = "#{params[:status]}!"
    @task.send(action)
  end

  def destroy
    @task = current_user.tasks.find params[:id]
    @task.destroy
  end

  private

  def task_params
    params.require(:task).permit(:user_id, :important, :urgent, :description)
  end

  def set_task
    @task = current_user.tasks.find params[:id]
  end
end
