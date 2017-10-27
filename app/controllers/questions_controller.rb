class QuestionsController < BaseController
  def index
    load_questions
  end

  private

  def load_questions
    # TODO: policy
    @q = Question.ransack params[:q]
    @results = @q.result distinct: true
    # @q.sorts = ['attachments_updated_at desc', 'name_pinyin asc'] if @q.sorts.empty?
    @questions = @results.paginate(page: params[:page], per_page: 20)
  end
end
