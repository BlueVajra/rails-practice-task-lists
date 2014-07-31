class TaskList < ActiveRecord::Base

  has_many :tasks

  def self.with_filtered_tasks(user_id)
    includes(:tasks).where('tasks.assigned_to' =>  user_id, 'tasks.completed' => false)
  end

end