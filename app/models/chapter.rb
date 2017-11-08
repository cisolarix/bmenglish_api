class Chapter < ApplicationRecord
  has_ancestry

  has_and_belongs_to_many :questions
end