class Option < ApplicationRecord
  acts_as_paranoid

  belongs_to :question

  # TODO: 校验 hash_id 的唯一性

  before_create :populate_hash_id

  private

  def populate_hash_id
    self.hash_id = SecureRandom.hex
  end
end
