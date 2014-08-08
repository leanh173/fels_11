class AddNameToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :name, :string
    add_index :lessons, :name
  end
end
