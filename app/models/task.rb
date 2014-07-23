class Task < ActiveRecord::Base
  belongs_to :task_list
  validates :description, presence: true

  scope :incomplete, -> { where(complete?: false) }
  scope :ordered, -> { order(:due_date) }

  def self.owned(user)
    where(user_id: user.id)
  end
end