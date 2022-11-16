class Test < ApplicationRecord
  class << self
    def tests_of_category(category)
      joins('JOIN categories on categories.id = tests.category_id')
        .where('categories.title = ?', category).order(title: :desc)
        .pluck(:title)
    end
  end
end
