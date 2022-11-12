class Question < ApplicationRecord
  has_and_belongs_to_many :tests
  has_many :answers
end
