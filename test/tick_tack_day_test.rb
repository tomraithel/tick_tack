require 'test_helper'

class TickTackDayTest < Minitest::Test
  def setup
    TickTack.now = Date.new(2015, 5, 27)
    @day = TickTack::Day.new
  end

  def test_that_it_defaults_to_now
    assert_equal @day.year, 2015
    assert_equal @day.month, 5
    assert_equal @day.day, 27
  end

  def test_that_year_can_be_overwritten
    d = TickTack::Day.new(2013)
    assert_equal d.year, 2013
    d.year = 2014
    assert_equal d.year, 2014
  end

  def test_that_month_can_be_overwritten
    d = TickTack::Day.new(2013, 11)
    assert_equal d.month, 11
    d.month = 1
    assert_equal d.month, 1
  end

  def test_that_day_can_be_overwritten
    d = TickTack::Day.new(2013, 11, 12)
    assert_equal d.day, 12
    d.day = 1
    assert_equal d.day, 1
  end

  def test_get_date
    assert_equal @day.date, Date.new(2015, 5, 27)
  end

  def test_equality
    day = TickTack::Day.new
    assert_equal @day, day
  end
end
