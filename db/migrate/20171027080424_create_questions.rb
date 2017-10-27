class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :title
      t.text :answers, array: true, default: []
      t.text :tags, array: true, default: []
      t.timestamps
    end
  end
end
