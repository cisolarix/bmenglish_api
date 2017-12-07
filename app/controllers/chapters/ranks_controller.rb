class Chapters::RanksController < BaseController
  def show
    load_chapters
  end

  def create
    build_chapter_rank
    @rank.save
  end

  private

  def load_chapters
    @chapters = Chapter.roots
  end

  def build_chapter_rank
    @rank = Chapters::Sort.new
    @rank.attributes = params.permit(chapter_ids: [])
  end

  def ensure_priviledge!
    # TODO
    true
  end
end
