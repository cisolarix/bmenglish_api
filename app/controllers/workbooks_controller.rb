class WorkbooksController < BaseController
  def index
    load_workbooks
  end

  def create
    build_workbook
    @workbook.save
  end

  def show
    load_workbook
    load_textbook
  end

  private

  def load_workbooks
    @workbooks = current_user.workbooks
  end

  def build_workbook
    @workbook = Workbook.find_or_initialize_by workbook_params
  end

  def workbook_params
    { user: current_user, textbook_id: params[:textbook_id] }
  end

  def load_workbook
    @workbook = Workbook.find params[:id]
  end

  def load_textbook
    @textbook = Chapter.find(@workbook.textbook_id).subtree.arrange
  end

  def ensure_priviledge!
    authorize Workbook, :access?
  end
end
