class CreateWorkbookDrillItems < ActiveRecord::Migration[5.1]
  def change
    create_table :workbook_drill_items do |t|
      t.references :user
      t.references :question
      t.text       :selected
      t.boolean    :correct
      t.timestamps null: false
    end
  end
end
