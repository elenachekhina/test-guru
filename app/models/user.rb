# frozen_string_literal: true

class User < ApplicationRecord
  has_many :published_tests, foreign_key: 'author_id', class_name: 'Test', dependent: :destroy, inverse_of: :author
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  validates :email, presence: true

  delegate :tests_of_level, to: :tests

  def test_passage(test)
    test_passages.order(created_at: :desc).find_by(test_id: test.id)
  end
end
