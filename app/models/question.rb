class Question < ApplicationRecord
  acts_as_paranoid
  acts_as_taggable

  has_many :options, dependent: :destroy
  has_and_belongs_to_many :chapters

  accepts_nested_attributes_for :options, update_only: true

  def correct_answers
    @correct_answers ||= options.where(correct: true)
  end

  def correct_answers_ids
    correct_answers.ids
  end
end
