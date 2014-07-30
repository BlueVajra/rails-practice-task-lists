class Task < ActiveRecord::Base

  belongs_to :task_list
  validates_presence_of :description

  scope :incomplete, -> { where(completed: false) }

  belongs_to :user, foreign_key: "assigned_to"
end