class User < ApplicationRecord
  has_many :published_tests, foreign_key: 'author_id', class_name: 'Test', dependent: :nullify
  has_many :tests_results, dependent: :destroy
  has_many :tests, through: :tests_results
  def tests_of_level(level)
    tests.where(level: level)
  end
end
