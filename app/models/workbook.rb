class Workbook < ApplicationRecord
  belongs_to :user
  belongs_to :textbook

  delegate :title, to: :textbook
end
