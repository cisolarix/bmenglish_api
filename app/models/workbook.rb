class Workbook < ApplicationRecord
  belongs_to :user
  belongs_to :textbook
end
