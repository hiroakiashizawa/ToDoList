class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
