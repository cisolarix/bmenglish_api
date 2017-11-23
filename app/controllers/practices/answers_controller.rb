class Practices::AnswersController < BaseController
  def show
    load_workbook
    load_lesson
    load_result
    load_questions
  end

  private

  def load_workbook
    @workbook = Workbook.find params[:workbook_id]
  end

  def load_lesson
    @lesson = Lesson.find params[:lesson_id]
  end

  def load_result
    @result = Practices::Result.find params[:practice_id]
  end

  def load_questions
    @questions = @result.questions
  end
end
