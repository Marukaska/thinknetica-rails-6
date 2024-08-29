class GistsController < ApplicationController
  before_action :set_test_passage, only: %i[create]

  def create
    response = GistQuestionService.new(@test_passage.current_question)
    result = response.call

    flash_options = if response.success?
                      current_user.gists.create(question: @test_passage.current_question, url: result.html_url)
                      { notice: t('gist.success', gist_url: result.html_url )}
                    else
                      { alert: t('gist.failure') }
                    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:test_passage])
  end
end
