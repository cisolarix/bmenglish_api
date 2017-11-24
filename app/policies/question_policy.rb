class QuestionPolicy < ApplicationPolicy
  def index?
    user.is_a? Teacher
  end
end
