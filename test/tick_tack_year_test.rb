require 'test_helper'

class TickTackYearTest < Minitest::Test
  def setup
    @calendar = TickTack::Calendar.new(Date.new(2015, 5, 27))
    @year = @calendar.year
  end

  def test_that_getters_defaults_to_now
    assert_equal @year.year_i, 2015
  end

  def test_that_year_can_be_overwritten
    y = @calendar.year(2013)
    assert_equal y.year_i, 2013
    y.year_i = 2014
    assert_equal y.year_i, 2014
  end

  def test_first_day_of_year
    assert_equal @year.first_day, @calendar.day(2015, 1, 1)
  end

  def test_last_day_of_year
    assert_equal @year.last_day, @calendar.day(2015, 12, 31)
  end

  def test_compare
    bigger_year = @calendar.year(2016)
    assert bigger_year > @year
    assert @year < bigger_year
    assert bigger_year == bigger_year
  end

  def test_get_month
    assert_equal @year.month(1), @calendar.month(2015, 1)
  end
end
