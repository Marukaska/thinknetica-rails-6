class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :question_passages, class_name: 'TestPassage', foreign_key: :current_question_id, dependent: :destroy
  has_many :gists
  belongs_to :test

  validates :body, presence: true
end
