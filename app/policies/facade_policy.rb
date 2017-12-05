class FacadePolicy < ApplicationPolicy
  def access?
    user.class.to_s.in? %w[Student Teacher]
  end
end
