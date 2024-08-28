class GistsController < ApplicationController
  before_action :set_test_passage, only: %i[create]

  def create
    result = GistQuestionService.new(@test_passage.current_question)

    flash_options = if result.call && result.success?
                      puts(result)
                      puts('прошел')
                      gist = Gist.create(
                        question: @test_passage.current_question,
                        user: current_user,
                        url: result.client.last_response.data[:html_url]
                      )
                      { notice: t('gist.success', gist_url: gist.url )}
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
