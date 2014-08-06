class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :category_id

      t.timestamps
    end
    add_index :lessons, :category_id
  end
end
