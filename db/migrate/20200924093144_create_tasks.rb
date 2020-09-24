class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :description
      t.boolean :urgent, default: false
      t.boolean :important, default: false
      t.integer :user_id

      t.timestamps
    end
    add_index :tasks, :user_id
  end
end
