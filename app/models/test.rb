class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  belongs_to :author, foreign_key: 'author_id', class_name: 'User'
  has_many :tests_results
  has_many :users, through: :tests_results
  class << self
    def tests_of_category(category)
      joins('JOIN categories on categories.id = tests.category_id')
        .where('categories.title = ?', category).order(title: :desc)
        .pluck(:title)
    end
  end
end
