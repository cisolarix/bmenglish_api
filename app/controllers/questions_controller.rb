class QuestionsController < BaseController
  skip_before_action :verify_authenticity_token, only: %w[update create]

  def index
    load_questions
    puts '*' * 120
    ap @questions
    puts '*' * 120
  end

  def show
    load_question
  end

  # def new
  #   build_question
  # end

  def create
    build_question
    @question.save
  end

  # def edit
  #   load_question
  # end

  def update
    load_question
    build_question
    @question.save
  end

  private

  def load_questions
    # TODO: policy
    @q = Question.includes(:options).ransack params[:q]
    @q.sorts = 'id desc' if @q.sorts.empty?
    @results = @q.result(distinct: true)

    @questions = @results.page params[:page]
  end

  def load_question
    @question = Question.find params[:id]
  end

  def build_question
    @question ||= Question.new
    @question.attributes = question_params
  end

  def question_params
    params.fetch(:question, {})
          .permit(:id, :title, tag_list: [], options_attributes: [:id, :question_id, :content, :correct, :_destroy])
  end
end
