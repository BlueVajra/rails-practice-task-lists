class TaskListsController < ApplicationController

  def index
    p params
    if params[:task] && params[:task][:assigned_to].present?
      @user_id = params[:task][:assigned_to]
      @task_lists = TaskList.with_filtered_tasks(@user_id)
    else
      @task_lists = TaskList.order(:name).includes(:tasks).where('tasks.completed' => false)
    end
  end

end