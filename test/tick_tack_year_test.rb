require 'test_helper'

class TickTackYearTest < Minitest::Test
  def setup
    TickTack.now = Date.new(2015, 5, 27)
    @y = TickTack::Year.new()
  end

  def test_that_it_defaults_to_now_year
    assert_equal @y.year, 2015
  end

  def test_that_year_can_be_overwritten
    y = TickTack::Year.new(2013)
    assert_equal y.year, 2013
    y.year = 2014
    assert_equal y.year, 2014
  end

  def test_first_day_of_year
    assert_equal @y.first_day, Date.new(2015, 1, 1)
  end

  def test_last_day_of_year
    assert_equal @y.last_day, Date.new(2015, 12, 31)
  end

  def test_equality
    y = TickTack::Year.new()
    assert_equal @y, y
  end
end
