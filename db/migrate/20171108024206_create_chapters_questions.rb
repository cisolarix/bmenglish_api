class CreateChaptersQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :chapters_questions do |t|
      t.references :chapter
      t.references :question
    end
  end
end
