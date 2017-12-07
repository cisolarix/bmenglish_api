class Chapters::ClonesController < BaseController
  def show
    load_chapter
    build_chapter_clone
    load_chapters
  end

  def create
    load_chapter
    build_chapter_clone
    @clone.save
  end

  private

  def load_chapter
    @chapter = Chapter.find params[:chapter_id]
  end

  def load_chapters
    @chapters = Chapter.all
  end

  def build_chapter_clone
    @clone = Chapters::Clone.new(chapter: @chapter)
    @clone.attributes = clone_params
  end

  def clone_params
    params.fetch(:chapters_clone, {}).permit(:source)
  end

  def ensure_priviledge!
    # TODO
    true
  end
end
