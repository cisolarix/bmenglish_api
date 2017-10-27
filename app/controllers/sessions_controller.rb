class SessionsController < ApplicationController
  def new
    build_sign_in
  end

  def create
    build_sign_in
    if @sign_in.save
      login_as @sign_in.logged_user
      redirect_to root_path
    else
      flash[:info] = @sign_in.errors.full_messages.first
      redirect_back fallback_location: { action: sign_in_path }
    end
  end

  def destroy
  end

  private

  def build_sign_in
    @sign_in = Users::SignIn.new
    @sign_in.attributes = params.fetch(:users_sign_in, {}).permit(:cell, :password)
  end

  def login_as(user)
    return unless user && user.id
    session[:user_id] = user.id
  end

  def logout_as(user)
    session[:user_id] = nil
  end
end
