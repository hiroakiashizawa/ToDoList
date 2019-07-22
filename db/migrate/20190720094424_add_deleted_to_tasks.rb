class AddDeletedToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :deleted, :boolean, default: false, null: false
  end
end
