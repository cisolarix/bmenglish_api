class ChaptersController < BaseController
  def index
    load_chapters
    authorize :chapter, :index?
  end

  def new
    load_all_chapters
    build_chapter
  end

  def create
    build_chapter
    @chapter.save
  end

  def edit
    load_all_chapters
    load_chapter
  end

  def update
    load_chapter
    build_chapter
    @chapter.save
  end

  def destroy
    load_chapter
    @chapter.destroy
  end

  private

  def load_all_chapters
    @all_chapters = Chapter.all
  end

  def load_chapters
    @chapters = Chapter.arrange
  end

  def build_chapter
    @chapter ||= Chapter.new
    @chapter.attributes = params.fetch(:chapter, {}).permit(:title, :parent_id)
  end

  def load_chapter
    @chapter = Chapter.find params[:id]
  end
end
