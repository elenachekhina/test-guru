class Question < ApplicationRecord
  MIN_ANSWERS = 1
  MAX_ANSWERS = 4

  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validates :answers, length: { minimum: MIN_ANSWERS, maximum: MAX_ANSWERS }
end
