class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.string :content
      t.boolean :right_answer

      t.timestamps
    end 
    add_index :answers, :question_id
  end
end
