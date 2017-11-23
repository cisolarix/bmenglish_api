class Practices::Result < ApplicationRecord
  self.table_name = 'practice_results'

  belongs_to :user
  belongs_to :workbook
  belongs_to :lesson

  has_many :questions, class_name: 'Practices::Question'

  accepts_nested_attributes_for :questions
end
