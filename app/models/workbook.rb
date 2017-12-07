class Workbook < ApplicationRecord
  belongs_to :user
  belongs_to :textbook

  serialize :visible_lessons, Array

  delegate :title, to: :textbook

  before_create :populate_visible_lessons

  private

  def populate_visible_lessons
    self.visible_lessons = [textbook.first_leaf.id]
  end
end
