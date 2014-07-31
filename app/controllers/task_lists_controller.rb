class TaskListsController < ApplicationController

  def index
    if params[:task]
      @user_id = params[:task][:assigned_to]
      @task_lists = TaskList.order(:name).select do |task_list|
        task_list.tasks.map {|task| task.assigned_to}.include?(@user_id)
      end
    else
      @task_lists = TaskList.order(:name)
    end
  end

  # def index
  #   if params[:task]
  #     @user_id = params[:task][:assigned_to]
  #     @user = User.find(@user_id)
  #     @task_lists = TaskList.joins(tasks: @user)
  #   else
  #     @task_lists = TaskList.order(:name)
  #   end
  # end

end