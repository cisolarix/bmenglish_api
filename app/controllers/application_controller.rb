class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    render 'errors/403', status: 403, locals: {message: '您无法访问当前资源'}, formats: :html
  end
end
