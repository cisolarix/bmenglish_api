class Question < ApplicationRecord
  acts_as_paranoid

  has_many :options, dependent: :destroy
  accepts_nested_attributes_for :options, update_only: true

  before_create :populate_hash_id

  def correct_answers
    @correct_answers ||= Option.where(hash_id: answers)
  end

  private

  def populate_hash_id
    self.hash_id = $hashids.encode(Time.zone.now.to_i.to_s.split(''))
  end
end
