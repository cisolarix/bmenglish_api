class Question < ApplicationRecord
  acts_as_paranoid

  has_many :options, dependent: :destroy
  has_and_belongs_to_many :chapters

  accepts_nested_attributes_for :options, update_only: true

  def correct_answers
    @correct_answers ||= options.where(correct: true)
  end

  def correct_answers_ids
    correct_answers.ids
  end

  # 在表单页展示
  def chapter_options
    chapters.collect do |c|
      {
        id: c.id,
        title: "#{c.ancestors.pluck(:title).join(' ≫ ')} ≫ #{c.title}"
      }
    end
  end

  # 处理表单回传
  def chapter_options=(value)
    self.chapter_ids = value.collect { |v| v['id'] }
  end
end
