class QuestionsController < ApplicationController
  before_action :find_test
  before_action :find_question, only: [:show, :destroy]

  def index
    @questions = @test.questions
    render plain: @questions.map(&:body).join("\n")
  end

  def show
    render plain: @question.body
  end

  def new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      render plain: "Question created successfully"
    else
      render plain: "Error creating question"
    end
  end

  def destroy
    @question.destroy
    render plain: "Question deleted successfully"
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = @test.questions.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render plain: "Question not found", status: :not_found
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
