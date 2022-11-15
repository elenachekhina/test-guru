class Test < ApplicationRecord
  class << self
    def tests_of_category(category)
      self.where(category_id: Category.where(title: 'Backend').take.id).order(title: :desc).pluck(:title)
    end
  end
end
