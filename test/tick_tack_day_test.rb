require 'test_helper'

class TickTackDayTest < Minitest::Test
  def setup
    @calendar = TickTack::Calendar.new(Date.new(2015, 5, 27))
    @day = @calendar.day
  end

  def test_that_getters_defaults_to_now
    assert_equal @day.year_i, 2015
    assert_equal @day.month_i, 5
    assert_equal @day.day_i, 27
  end

  def test_that_year_can_be_overwritten
    d = @calendar.day(2013)
    assert_equal d.year_i, 2013
    d.year_i = 2014
    assert_equal d.year_i, 2014
  end

  def test_that_month_can_be_overwritten
    d = @calendar.day(2013, 11)
    assert_equal d.month_i, 11
    d.month_i = 1
    assert_equal d.month_i, 1
  end

  def test_that_day_can_be_overwritten
    d = @calendar.day(2013, 11, 12)
    assert_equal d.day_i, 12
    d.day_i = 1
    assert_equal d.day_i, 1
  end

  def test_get_date
    assert_equal @day.date, Date.new(2015, 5, 27)
  end

  def test_get_month
    assert_equal @day.month, @calendar.month(2015, 5)
  end

  def test_get_year
    assert_equal @day.year, @calendar.year(2015)
  end

  def test_equality
    day = @calendar.day
    assert_equal @day, day
  end
end
