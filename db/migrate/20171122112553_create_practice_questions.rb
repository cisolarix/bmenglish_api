class CreatePracticeQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :practice_questions do |t|
      t.references :result
      t.references :question
      t.text :choices
      t.boolean :correct, default: false
      t.timestamps null: false
    end
  end
end
