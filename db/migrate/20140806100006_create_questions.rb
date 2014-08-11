class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :category_id
      t.string :content
      t.string :word
      t.string :sound

      t.timestamps
    end
    add_index :questions, :category_id
    add_index :questions, :word
  end
end
