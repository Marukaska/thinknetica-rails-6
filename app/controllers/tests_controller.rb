class TestsController < ApplicationController
  before_action :set_test, only: %i[start]

  def index
    @tests = Test.ready
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end
end
