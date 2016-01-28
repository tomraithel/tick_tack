require 'test_helper'

class TickTackMonthTest < Minitest::Test
  def setup
    TickTack.now = Date.new(2015, 5, 27)
    @month = TickTack::Month.new
  end

  def test_that_getters_defaults_to_now
    assert_equal @month.year_i, 2015
    assert_equal @month.month_i, 5
  end

  def test_that_year_can_be_overwritten
    m = TickTack::Month.new(2013)
    assert_equal m.year_i, 2013
    m.year_i = 2014
    assert_equal m.year_i, 2014
  end

  def test_that_month_can_be_overwritten
    m = TickTack::Month.new(2013, 11)
    assert_equal m.month_i, 11
    m.month_i = 1
    assert_equal m.month_i, 1
  end

  def test_first_day_of_month
    assert_equal @month.first_day, TickTack::Day.new(2015, 5, 1)
  end

  def test_last_day_of_month
    [
        [TickTack::Month.new(2016, 1), TickTack::Day.new(2016, 1, 31)],
        [TickTack::Month.new(2016, 2), TickTack::Day.new(2016, 2, 29)],
        [TickTack::Month.new(2016, 4), TickTack::Day.new(2016, 4, 30)],
    ].each do |test|
      assert_equal test[0].last_day, test[1]
    end
  end

  def test_equality
    m = TickTack::Month.new
    assert_equal @month, m
  end

  def test_get_day
    assert_equal @month.day(12), TickTack::Day.new(2015, 5, 12)
  end

  def test_get_year
    assert_equal @month.year, TickTack::Year.new(2015)
  end
end
