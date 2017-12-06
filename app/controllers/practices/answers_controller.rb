class Practices::AnswersController < BaseController
  def show
    load_practice
    load_questions
  end

  private

  def load_practice
    @practice = Practices::Result.find params[:id]
  end

  def load_questions
    @questions = @practice.questions
  end

  def ensure_priviledge!
    authorize :'Practices::Answer', :access?
  end
end
