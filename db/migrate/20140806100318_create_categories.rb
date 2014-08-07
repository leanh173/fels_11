class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name_course

      t.timestamps
    end
    add_index :categories, :name_course
  end
end
