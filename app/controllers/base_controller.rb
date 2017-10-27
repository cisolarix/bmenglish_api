class BaseController < ApplicationController
  before_action :login_required!

  protected

  def login_required!
    redirect_to sign_in_path and return unless current_user
  end

  def current_user
    @current_user ||= User.find_by session[:user_id]
  end
end
