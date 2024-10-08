class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :set_next_question, on: :update
  before_update :set_success, if: :completed?


  PERCENTAGE_PASSING_TEST_CORRECTLY = 85

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    save!
  end

  def success?
    percentage_of_correct_answers >= PERCENTAGE_PASSING_TEST_CORRECTLY
  end

  def percentage_of_correct_answers
    (correct_questions.to_f / test.questions.count * 100).round(2)
  end

  def time_left
    return nil unless test.timed?
    test.timer * 60 - (Time.current - created_at).to_i
  end

  def time_up?
    return nil unless test.timed?
    time_left <= 0
  end

  private

  def correct_answer?(answer_ids)
    !answer_ids.nil? && correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def set_next_question
    self.current_question = next_question
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def set_success
    self.success = success? # Сохранение результата в столбец success
  end
end
