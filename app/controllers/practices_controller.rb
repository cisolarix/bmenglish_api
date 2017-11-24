class PracticesController < BaseController
  skip_before_action :verify_authenticity_token, only: %w[create]

  def show
    load_workbook
    load_lesson
    load_questions
    gon.params = params
  end

  def create
    build_practice
    @practice.save
  end

  private

  def load_workbook
    @workbook = Workbook.find params[:workbook_id]
    gon.workbook_title = @workbook.textbook.title
  end

  def load_lesson
    @lesson = Chapter.find params[:id]
    gon.lesson_title = "#{@lesson.parent.title} - #{@lesson.title}"
  end

  def load_questions
    @questions = @lesson.questions.includes(:options)
  end

  def build_practice
    @practice = Practice.new
    @practice.attributes = practice_params.merge(
      user: current_user,
      workbook_id: params['workbook_id'],
      lesson_id: params['id']
    )
  end

  def practice_params
    params.fetch(:practice, {}).permit(choices: [:questionId, optionId: []])
  end
end
