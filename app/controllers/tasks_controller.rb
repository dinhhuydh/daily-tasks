class TasksController < ApplicationController
  before_action :authenticate_user

  def index
    @tasks = current_user.tasks
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    @task.save
  end

  def update
  end

  def destroy
  end

  private

  def task_params
    params.require(:task).permit(:user_id, :important, :urgent, :description)
  end
end
