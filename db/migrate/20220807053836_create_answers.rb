class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.references :log, foreign_key: true, null: false
      t.references :question, foreign_key: true, null: false
      t.boolean :is_good_habit, null: false

      t.timestamps
    end
    
    add_index :answers, [:log_id, :question_id], unique: true
  end
end
