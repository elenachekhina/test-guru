class User < ApplicationRecord
  has_many :published_tests, foreign_key: 'author_id', class_name: 'Test', dependent: :destroy
  has_many :tests_results, dependent: :destroy
  has_many :tests, through: :tests_results

  validates :email, presence: true

  def tests_of_level(level)
    tests.tests_of_level(level)
  end
end
