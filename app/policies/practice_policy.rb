class PracticePolicy < ApplicationPolicy
  def access?
    user.is_a? Student
  end
end
