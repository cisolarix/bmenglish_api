class Practices::AnswerPolicy < ApplicationPolicy
  def access?
    user.is_a? Teacher
  end
end
