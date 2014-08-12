class AddMarkToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :mark, :integer, :default => 0
  end
end
