class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result gist]

  def show
  end

  def result
  end

  def update
    if @test_passage.completed? || @test_passage.time_up?
      redirect_to result_test_passage_path(@test_passage), alert: "Time is up!"
    else
      @test_passage.accept!(params[:answer_ids])

      if @test_passage.completed?
        TestsMailer.completed_test(@test_passage).deliver_now
        BadgeAwardService.new(current_user, @test_passage).call
        redirect_to result_test_passage_path(@test_passage)
      else
        render :show
      end
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
