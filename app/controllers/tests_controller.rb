# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :set_user, only: %i[start]
  def index
    @tests = Test.all
  end

  def start
    @test = Test.find(params[:id])
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  def show
    @test = Test.find(params[:id])
  end

  private

  def set_user
    @user = User.first
  end
end
