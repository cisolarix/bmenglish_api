class Question < ApplicationRecord
  acts_as_paranoid

  has_many :options, dependent: :destroy
  accepts_nested_attributes_for :options, update_only: true

  # TODO: 校验 hash_id 的唯一性

  before_create :populate_hash_id

  def correct_answers
    @correct_answers ||= Option.where(hash_id: answers)
  end

  private

  def populate_hash_id
    self.hash_id = SecureRandom.hex
  end
end
