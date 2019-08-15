class AddTimelimitToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :timelimit, :datetime 
  end
end
