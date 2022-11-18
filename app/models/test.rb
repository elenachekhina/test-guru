class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, foreign_key: 'author_id', class_name: 'User'

  has_many :questions, dependent: :nullify
  has_many :tests_results, dependent: :destroy
  has_many :users, through: :tests_results
  class << self
    def tests_of_category(category)
      Category.where(title: category).joins(:tests)
              .order(title: :desc)
              .pluck(:title)
    end
  end
end
