# frozen_string_literal: true

class User < ApplicationRecord
  has_many :published_tests, foreign_key: 'author_id', class_name: 'Test', dependent: :destroy, inverse_of: :author
  has_many :tests_results, dependent: :destroy
  has_many :tests, through: :tests_results

  validates :email, presence: true

  delegate :tests_of_level, to: :tests
end
