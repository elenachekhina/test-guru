# frozen_string_literal: true

module TestsHelper
  TEST_LEVELS = {
    0 => :elementary,
    1 => :easy,
    2 => :middle,
    3 => :hard,
    4 => :superman
  }.freeze
  def test_level(test)
    TEST_LEVELS[test.level] || :hard
  end

  def test_categories
    Category.show
  end
end
