class SessionsController < ApplicationController
  def new
    build_sign_in
  end

  def create
    build_sign_in
    if @sign_in.save
      login_as @sign_in.logged_user
      redirect_to @sign_in.logged_user.is_a?(Student) ? workbooks_path : questions_path
    else
      flash[:error] = @sign_in.errors.full_messages.first
      redirect_back fallback_location: { action: sign_in_path }
    end
  end

  def destroy
    logout
    redirect_to sign_in_path
  end

  private

  def build_sign_in
    @sign_in = Users::SignIn.new
    @sign_in.attributes = params.fetch(:users_sign_in, {})
                                .permit(:cell, :password)
  end

  def login_as(user)
    return unless user && user.id
    session[:user_id] = user.id
  end

  def logout
    session[:user_id] = nil
  end
end
