# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_save, on: :create

  scope :correct, -> { where(correct: true) }

  def to_s
    body
  end

  private

  def validate_save
    errors.add(:validate_save) if question.answers.count >= 4
  end
end
