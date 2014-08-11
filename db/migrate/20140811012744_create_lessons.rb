class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
    add_index :lessons, :user_id
    add_index :lessons, :category_id
  end
end
