class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_parameters)
    task.task_list_id = params[:task_list_id]
    task.save
    redirect_to root_path, notice: "Task was created successfully!"
  end

  private

  def task_parameters
    params.require(:task).permit(:description, :due_date)
  end
end