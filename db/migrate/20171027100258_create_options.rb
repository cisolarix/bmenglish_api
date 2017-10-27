class CreateOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :options do |t|
      t.text :content
      t.references :question
      t.timestamps
    end
  end
end
