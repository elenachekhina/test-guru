class User < ApplicationRecord
  def tests_of_level(level)
    TestsResult.where(user_id: self.id)
               .joins('JOIN tests on tests.id = tests_results.test_id')
               .where('tests.level = ?', level).select('tests.*')
  end
end
