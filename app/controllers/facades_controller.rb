class FacadesController < BaseController
  def index
    if current_user.is_a? Teacher
      redirect_to questions_path
    elsif current_user.is_a? Student
      redirect_to workbooks_path
    end
  end

  def ensure_priviledge!
    authorize :facade, :access?
  end
end
