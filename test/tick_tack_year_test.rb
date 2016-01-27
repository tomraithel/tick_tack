require 'test_helper'

class TickTackYearTest < Minitest::Test
  def setup
    TickTack.now = Date.new(2015, 5, 27)
    @year = TickTack::Year.new()
  end

  def test_that_it_defaults_to_now
    assert_equal @year.year, 2015
  end

  def test_that_year_can_be_overwritten
    y = TickTack::Year.new(2013)
    assert_equal y.year, 2013
    y.year = 2014
    assert_equal y.year, 2014
  end

  def test_first_day_of_year
    assert_equal @year.first_day, TickTack::Day.new(2015, 1, 1)
  end

  def test_last_day_of_year
    assert_equal @year.last_day, TickTack::Day.new(2015, 12, 31)
  end

  def test_equality
    y = TickTack::Year.new
    assert_equal @year, y
  end

  def test_get_month
    assert_equal @year.month(1), TickTack::Month.new(2015, 1)
  end
end
