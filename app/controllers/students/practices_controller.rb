class Students::PracticesController < BaseController
  def index
    load_student
    load_practices
  end

  private

  def load_student
    @student = Student.find params[:student_id]
  end

  def load_practices
    @q = @student.practices.ransack params[:q]
    @practices = @q.result.page params[:page]
  end

  def ensure_priviledge!
    authorize 'Students::Practice'.to_sym, :access?
  end
end
