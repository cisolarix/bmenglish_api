class ChapterPolicy < ApplicationPolicy
  def index?
    user.super?
  end
end
