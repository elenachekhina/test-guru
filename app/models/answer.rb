class Answer < ApplicationRecord
  belongs_to :question
  before_destroy :validate_destroy

  validates :body, presence: true
  validate :validate_save

  scope :correct, -> { where(correct: true) }

  def validate_destroy
    errors.add(:validate_destroy) if question.answers.size <= Question::MIN_ANSWERS
    throw(:abort) if errors.present?
  end

  def validate_save
    errors.add(:validate_save) if question.answers.size >= Question::MAX_ANSWERS
  end
end
