class User < ApplicationRecord
  has_many :published_tests, foreign_key: 'author_id', class_name: 'Test'
  has_many :tests_results
  has_many :tests, through: :tests_results
  def tests_of_level(level)
    TestsResult.where(user_id: self.id)
               .joins('JOIN tests on tests.id = tests_results.test_id')
               .where('tests.level = ?', level).select('tests.*')
  end
end
