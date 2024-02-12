class CreateSubTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :sub_tasks do |t|
      t.string :title
      t.boolean :completed
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
