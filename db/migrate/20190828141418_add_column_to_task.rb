class AddColumnToTask < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :project, foreign_key: true
  end
end
