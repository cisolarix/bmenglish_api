class TextbooksController < BaseController
  def index
    load_books
  end

  def show
    load_book
  end

  private

  def load_books
    @books ||= Chapter.where(ancestry: nil)
  end

  def load_book
    @book = Chapter.find(params[:id]).subtree.arrange
  end
end
