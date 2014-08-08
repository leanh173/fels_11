class AddDescriptionToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :description, :string
    add_index :lessons, :description
  end
end
