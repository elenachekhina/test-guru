module TestsHelper
  TEST_LEVELS = {
    0 => :easy,
    1 => :easy,
    2 => :middle,
    3 => :middle,
    4 => :middle
  }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || :hard
  end
end
