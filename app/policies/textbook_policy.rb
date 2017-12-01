class TextbookPolicy < ApplicationPolicy
  def access?
    user.is_a? Student
  end
end
