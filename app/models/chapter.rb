class Chapter < ApplicationRecord
  has_ancestry

  has_and_belongs_to_many :questions

  default_scope { order(position: :asc) }

  validates :title, presence: true

  before_save :populate_position

  def previous
    siblings.where('position < ?', position).first
  end

  def next
    siblings.where('position > ?', position).first
  end

  def first_leaf
    children.first.children.first
  end

  private

  def populate_position
    return if position.present? && position.to_i > 0
    return if siblings.blank?
    self.position = siblings.maximum(:position) + 10
  end
end
