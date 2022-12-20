# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to redirect_path
    else
      flash.now[:alert] = 'Verify your Email and Password, please'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end

  private

  def redirect_path
    if cookies[:path].present?
      path = cookies[:path]
      cookies.delete(:path)
    else
      path = tests_path
    end
    path
  end
end
