class CreatePracticeResults < ActiveRecord::Migration[5.1]
  def change
    create_table :practice_results do |t|
      t.references :user
      t.references :workbook
      t.references :lesson
      t.integer :score, default: 0
      t.timestamps null: false
    end
  end
end
