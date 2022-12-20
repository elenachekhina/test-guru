# frozen_string_literal: true

class User < ApplicationRecord
  VALIDATION_MESSAGES = {
    email_presence: 'Email can`t be empty',
    email_format: 'Wrong format',
    email_uniqueness: 'Email already exists'
  }.freeze

  has_many :published_tests, foreign_key: 'author_id', class_name: 'Test', dependent: :destroy, inverse_of: :author
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  validates :email, presence: { message: VALIDATION_MESSAGES[:email_presence] }
  validates :email, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
    message: VALIDATION_MESSAGES[:email_format]
  }
  validates :email, uniqueness: { message: VALIDATION_MESSAGES[:email_uniqueness] }

  delegate :tests_of_level, to: :tests

  has_secure_password

  def test_passage(test)
    test_passages.order(created_at: :desc).find_by(test_id: test.id)
  end
end
