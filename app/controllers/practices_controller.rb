class PracticesController < BaseController
  skip_before_action :verify_authenticity_token, only: %w[create]

  def show
    load_lesson
    load_questions
  end

  def create
    # puts '*' * 100
    # puts params.inspect
    # puts '*' * 100
    build_practice
    @practice.save
  end

  private

  def load_lesson
    @lesson = Chapter.find params[:lesson_id]
  end

  def load_questions
    # @questions = @lesson.questions
    @questions = Question.includes(:options).first(3)
  end

  def build_practice
    @practice = Practice.new
    @practice.attributes = practice_params.merge(
      user: current_user,
      workbook_id: params['workbook_id'],
      lesson_id: params['lesson_id']
    )
    puts '*' * 100
    puts practice_params.inspect
    ap @practice
    puts '*' * 100
  end

  def practice_params
    params.fetch(:practice, {}).permit(choices: [:questionId, optionId: []])
   #  "practice" => {
   #   "userChoices" => [{
   #     "questionId" => 1,
   #     "optionId" => [3, 4]
   #   }, {
   #     "questionId" => 2,
   #     "optionId" => [8]
   #   }, {
   #     "questionId" => 3,
   #     "optionId" => [10]
   #   }]
   # }
  end
end
