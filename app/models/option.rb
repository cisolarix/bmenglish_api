class Option < ApplicationRecord
  acts_as_paranoid

  belongs_to :question

  before_create :populate_hash_id

  private

  def populate_hash_id
    self.hash_id = $hashids.encode(Time.zone.now.to_i.to_s.split(''))
  end
end
