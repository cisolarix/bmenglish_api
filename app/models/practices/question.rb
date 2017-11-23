class Practices::Question < ApplicationRecord
  self.table_name = 'practice_questions'

  belongs_to :result
  belongs_to :question

end
