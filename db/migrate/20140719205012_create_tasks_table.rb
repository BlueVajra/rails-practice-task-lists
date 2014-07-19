class CreateTasksTable < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description
      t.date :due_date
      t.belongs_to :task_list
      t.timestamp
    end
  end
end
