class QuestionsController < BaseController
  def index
    load_questions
  end

  def show
    load_question
  end

  def new
    build_question
    @question.options.build
  end

  def create

  end

  def edit
    load_question
  end

  def update
    load_question
    build_question
    if @question.save
      flash[:info] = '成功修改题目'
      redirect_to question_path(id: @question.hash_id)
    else
      flash[:info] = @question.errors.full_messages.first
      redirect_back fallback_location: edit_question_path(id: @question.hash_id)
    end
  end

  private

  def load_questions
    # TODO: policy
    @q = Question.ransack params[:q]
    @results = @q.result(distinct: true)
    @questions = @results.page params[:page]
  end

  def load_question
    @question = Question.find_by hash_id: params[:id]
  end

  def build_question
    @question ||= Question.new
    @question.attributes = question_params
  end

  def question_params
    params.fetch(:question, {})
          .permit(:id, :title, tag_list: [], answers: [], options_attributes: [:id, :content])
  end
end
