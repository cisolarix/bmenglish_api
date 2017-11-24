class BaseController < ApplicationController
  before_action :login_required!

  helper_method :current_user

  protected

  def login_required!
    redirect_to sign_in_path and return unless current_user
  end

  def current_user
    @current_user ||= User.find_by id: session[:user_id]
    gon.current_user = @current_user
  end
end
