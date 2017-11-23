class Workbooks::DrillItem < ApplicationRecord
  self.table_name = 'workbook_drill_items'

  belongs_to :user
  belongs_to :question

  serialize :selected, Array
end
