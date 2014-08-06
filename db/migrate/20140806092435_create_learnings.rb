class CreateLearnings < ActiveRecord::Migration
  def change
    create_table :learnings do |t|
      t.integer :user_id
      t.integer :lesson_id

      t.timestamps
    end
    add_index :learnings, :user_id
    add_index :learnings, :lesson_id
  end
end
