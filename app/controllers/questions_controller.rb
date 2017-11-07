class QuestionsController < BaseController
  skip_before_action :verify_authenticity_token, only: %w[update create destroy]

  def index
    load_questions
  end

  def show
    load_question
  end

  def create
    build_question
    @question.save
  end

  def update
    load_question
    build_question
    @question.save
  end

  def destroy
    load_question
    @question.destroy
  end

  private

  def load_questions
    # TODO: policy
    @q = Question.includes(:options).ransack params[:q]
    @q.sorts = 'id desc' if @q.sorts.empty?
    results = @q.result(distinct: true)
    @current_page = params[:page] || 1
    @total = results.count
    @questions = results.page(@current_page).per(10)
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
