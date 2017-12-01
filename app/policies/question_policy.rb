class QuestionPolicy < ApplicationPolicy
  def index?
    user.is_a? Teacher
  end

  def access?
    user.is_a? Teacher
  end
end
