class TextbooksController < BaseController
  def index
    load_books
  end

  def show
    load_book
    load_workbook
  end

  private

  def load_books
    @books ||= Textbook.all
  end

  def load_book
    @textbook = Chapter.find(params[:id]).subtree.arrange
  end

  def load_workbook
    @workbook = Workbook.find_by(user_id: current_user.id, textbook_id: params[:id])
  end
end
