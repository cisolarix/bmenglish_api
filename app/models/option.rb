class Option < ApplicationRecord
  acts_as_paranoid

  belongs_to :question

  default_scope { order(id: :desc) }
end
