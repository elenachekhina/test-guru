# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test, only: %i[start show]
  def index
    @tests = Test.all
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  def show; end

  private

  def set_test
    @test = Test.find(params[:id])
  end
end
