class User < ApplicationRecord
  def tests_of_level(level)
    Test.where(level: level, author_id: self.id)
  end
end
