class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_parameters)
    task.task_list_id = params[:task_list_id]
    if task.save
    redirect_to root_path, notice: "Task was created successfully!"
    else
      @task = task
      render :new
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.delete
    redirect_to root_path
  end

  private

  def task_parameters
    params.require(:task).permit(:description, :due_date)
  end
end