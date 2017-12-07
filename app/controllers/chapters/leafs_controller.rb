class Chapters::LeafsController < BaseController
  def show
    load_chapter
    build_leaf
  end

  def create
    load_chapter
    build_leaf
    @leaf.save
  end

  private

  def load_chapter
    @chapter = Chapter.find params[:chapter_id]
  end

  def build_leaf
    @leaf = Chapter.new(parent: @chapter)
    @leaf.attributes = params.fetch(:chapter, {}).permit(:title)
  end

  def ensure_priviledge!
    # raise '必须由子类来实现'
    true
  end
end
