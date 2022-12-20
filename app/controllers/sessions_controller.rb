# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :authenticate_user!, only: %i[destroy]

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
    cookies.delete(:user_path) || tests_path
  end
end
