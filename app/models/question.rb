class Question < ApplicationRecord
  has_many :answers
  has_many :question_passages, class_name: 'TestPassage', foreign_key: :current_question_id
  belongs_to :test

  validates :body, presence: true
end
