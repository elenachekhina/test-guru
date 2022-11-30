class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :new, :create]
  before_action :find_question, only: [:show, :edit, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index

  end

  def show
    render @question
  end

  def new

  end

  def create
    @test.questions << Question.new(question_params)
    redirect_to action: "index", test_id: @test.id
  end

  def edit

  end

  def destroy
    render plain: "Question #{@question.body} was successfully deleted" if @question.destroy
  end

  private
  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
