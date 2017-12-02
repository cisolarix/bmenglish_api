class StudentsController < BaseController
  def index
    load_students
  end

  def new
    build_student
  end

  def create
    build_student
    @student.save
  end

  def edit
    load_student
  end

  def update
    load_student
    build_student
    @student.save
  end

  def destroy
    load_student
    @student.destroy
  end

  private

  def load_student
    @student = Student.find params[:id]
  end

  def load_students
    @q = Student.ransack params[:q]
    @students = @q.result.page params[:page]
  end

  def build_student
    @student ||= Student.new
    @student.attributes = student_params
  end

  def student_params
    params.fetch(:student, {}).permit(:name, :cell, :password)
  end

  def ensure_priviledge!
    authorize :student, :access?
  end
end
