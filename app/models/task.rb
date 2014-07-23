class Task < ActiveRecord::Base
  belongs_to :task_list
  validates :description, presence: true

  scope :incomplete, -> { where(complete?: false)}
end