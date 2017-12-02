class Students::PracticePolicy < ApplicationPolicy
  def access?
    user.is_a? Teacher
  end
end
