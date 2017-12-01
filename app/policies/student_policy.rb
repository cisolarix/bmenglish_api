class StudentPolicy < ApplicationPolicy
  def index?
    user.super?
  end

  def access?
    user.super?
  end
end
