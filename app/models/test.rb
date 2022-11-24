class Test < ApplicationRecord
  LEVELS = {
    easy: 0..1,
    middle: 2..4,
    hard: 5..Float::INFINITY
  }.freeze

  belongs_to :category
  belongs_to :author, foreign_key: 'author_id', class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :tests_results, dependent: :destroy
  has_many :users, through: :tests_results

  validates :title, presence: true
  validates :level, numericality: { only_integer: true }, comparison: { greater_than: 0 }, uniqueness: { scope: :title }

  scope :tests_of_level, ->(level) { where(level: LEVELS[level]) }
  scope :tests_of_category, ->(category) { joins(:category).where(category: { title: category }).order(title: :desc) }
  scope :easy, -> { tests_of_level(:easy) }
  scope :middle, -> { tests_of_level(:middle) }
  scope :hard, -> { tests_of_level(:hard) }
end
