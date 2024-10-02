class Badge < ApplicationRecord
  has_many :user_badges
  has_many :users, through: :user_badges

  validates :title, :image_filename, :rule_type, presence: true

  RULES = {
    'All tests from a category' => :category_complete,
    'First attempt pass' => :first_attempt,
    'All tests of a certain level' => :level_complete
  }.freeze
end
