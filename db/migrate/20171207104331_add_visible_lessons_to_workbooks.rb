class AddVisibleLessonsToWorkbooks < ActiveRecord::Migration[5.1]
  def change
    add_column :workbooks, :visible_lessons, :text
  end
end
