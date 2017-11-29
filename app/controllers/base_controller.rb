class BaseController < ApplicationController
  before_action :login_required!
  before_action :populate_gon

  helper_method :current_user

  protected

  def login_required!
    redirect_to sign_in_path and return unless current_user
  end

  def current_user
    @current_user ||= User.find_by id: session[:user_id]
  end

  def populate_gon
    gon.current_user = @current_user
    gon.base_url = ENV['FE_BASE_URL']
  end
end
