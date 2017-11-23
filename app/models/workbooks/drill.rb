class Workbooks::Drill < ApplicationRecord
  self.table_name = 'workbook_drills'

  belongs_to :user
  belongs_to :workbook
  belongs_to :less
end
