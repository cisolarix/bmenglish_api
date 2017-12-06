class Chapters::SortsController < BaseController
  def show
    load_chapter
    load_children
  end

  def create
    build_chapter_sort
    @sort.save
  end

  private

  def load_chapter
    @chapter = Chapter.find params[:chapter_id]
  end

  def load_children
    @children = @chapter.children.order(position: :asc)
  end

  def build_chapter_sort
    @sort = Chapters::Sort.new
    @sort.attributes = sort_params
  end

  def sort_params
    params.permit(chapter_ids: [])
  end

  def ensure_priviledge!
    # TODO
    true
  end
end
