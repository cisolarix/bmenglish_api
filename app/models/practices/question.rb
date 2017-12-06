class Practices::Question < ApplicationRecord
  self.table_name = 'practice_questions'

  serialize :choices, Array

  belongs_to :result

  belongs_to :question, class_name: '::Question', foreign_key: 'question_id'
  belongs_to :question_with_deleted, -> { with_deleted }, class_name: '::Question', foreign_key: 'question_id'
end
