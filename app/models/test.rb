# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :title, presence: true
  validates :level, numericality: { only_integer: true }, comparison: { greater_than: 0 }, uniqueness: { scope: :title }

  scope :tests_of_level, ->(level) { where(level: level) }
  scope :tests_of_category, ->(category) { joins(:category).where(category: { title: category }).order(title: :desc) }
  scope :easy, -> { tests_of_level(0..1) }
  scope :middle, -> { tests_of_level(2..4) }
  scope :hard, -> { tests_of_level(5..Float::INFINITY) }
  scope :questions, ->(id) { where(id: id).questions }

  class << self
    def tests_list_of_category(category)
      tests_of_category(category).pluck(:title)
    end
  end

  def to_s
    title
  end
end
