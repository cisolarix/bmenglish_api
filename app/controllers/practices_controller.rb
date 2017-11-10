class PracticesController < BaseController
  def show
    load_lesson
    load_questions
  end

  private

  def load_lesson
    @lesson = Chapter.find params[:lesson_id]
  end

  def load_questions
    # @questions = @lesson.questions
    @questions = Question.includes(:options).first(10)
  end
end
