class Chapter < ApplicationRecord
  has_ancestry

  has_and_belongs_to_many :questions

  default_scope { order(position: :asc) }

  validates :title, presence: true
end
