class CreateWorkbooks < ActiveRecord::Migration[5.1]
  def change
    create_table :workbooks do |t|
      t.references :user
      t.references :textbook
      t.boolean :hidden, default: false
      t.timestamps null: false
    end
  end
end
