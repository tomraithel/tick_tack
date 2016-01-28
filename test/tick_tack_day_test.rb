require 'test_helper'

class TickTackDayTest < Minitest::Test
  def setup
    TickTack.now = Date.new(2015, 5, 27)
    @day = TickTack::Day.new
  end

  def test_that_getters_defaults_to_now
    assert_equal @day.year_i, 2015
    assert_equal @day.month_i, 5
    assert_equal @day.day_i, 27
  end

  def test_that_year_can_be_overwritten
    d = TickTack::Day.new(2013)
    assert_equal d.year_i, 2013
    d.year_i = 2014
    assert_equal d.year_i, 2014
  end

  def test_that_month_can_be_overwritten
    d = TickTack::Day.new(2013, 11)
    assert_equal d.month_i, 11
    d.month_i = 1
    assert_equal d.month_i, 1
  end

  def test_that_day_can_be_overwritten
    d = TickTack::Day.new(2013, 11, 12)
    assert_equal d.day_i, 12
    d.day_i = 1
    assert_equal d.day_i, 1
  end

  def test_get_date
    assert_equal @day.date, Date.new(2015, 5, 27)
  end

  def test_get_month
    assert_equal @day.month, TickTack::Month.new(2015, 5)
  end

  def test_get_year
    assert_equal @day.year, TickTack::Year.new(2015)
  end

  def test_equality
    day = TickTack::Day.new
    assert_equal @day, day
  end
end
