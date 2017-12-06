class Chapters::Sort < ActiveType::Object
  attribute :chapter_ids

  validates :chapter_ids, presence: true

  after_save :persist

  private

  def persist
    chapter_ids.each_with_index do |i, index|
      chapter = Chapter.find i
      chapter.position = (index + 1) * 10
      chapter.save
    end
  end
end
