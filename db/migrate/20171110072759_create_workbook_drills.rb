class CreateWorkbookDrills < ActiveRecord::Migration[5.1]
  def change
    create_table :workbook_drills do |t|
      t.references :user
      t.references :workbook
      t.references :lesson
      t.integer    :score
      t.integer    :seconds
      t.timestamps null: false
    end
  end
end
