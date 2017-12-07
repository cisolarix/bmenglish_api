class Chapters::Clone < ActiveType::Object
  attribute :chapter
  attribute :source

  validates :chapter, presence: true
  validates :source, presence: true

  after_save :persist

  private

  def persist
    return if source_chapter.blank?
    return if source_chapter.children.blank?
    source_chapter.children.each do |c|
      chapter.children.find_or_create_by! title: c.title, position: c.position
    end
  end

  def source_chapter
    @source_chapter = Chapter.find source
  end
end
