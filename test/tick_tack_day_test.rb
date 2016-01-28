require 'test_helper'

class TickTackDayTest < Minitest::Test
  def setup
    @calendar = TickTack::Calendar.new(Date.new(2015, 5, 27))
    @day = @calendar.day
  end

  def test_default_getters
    assert_equal @day.year_i, 2015
    assert_equal @day.month_i, 5
    assert_equal @day.day_i, 27
  end

  def test_overwrite_year
    d = @calendar.day(2013)
    assert_equal d.year_i, 2013
    d.year_i = 2014
    assert_equal d.year_i, 2014
  end

  def test_overwrite_month
    d = @calendar.day(2013, 11)
    assert_equal d.month_i, 11
    d.month_i = 1
    assert_equal d.month_i, 1
  end

  def test_overwrite_day
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

  def test_compare
    bigger_day = @calendar.day(2015, 5, 28)
    assert bigger_day > @day
    assert @day < bigger_day
    assert bigger_day == bigger_day
  end

  def test_next
    next_day = @calendar.day.next
    assert_equal next_day, @calendar.day(2015, 5, 28)
  end

  def test_previous
    next_day = @calendar.day.previous
    assert_equal next_day, @calendar.day(2015, 5, 26)
  end

  def test_week_start
    assert_equal @calendar.day.week_start, @calendar.day(2015, 5, 24)
  end

  def test_week_end
    assert_equal @calendar.day.week_end, @calendar.day(2015, 5, 30)
  end

  def test_week_start_with_dow_1
    calendar = TickTack::Calendar.new(Date.new(2015, 1, 1), {
        dow: 1
    })
    assert_equal calendar.day.week_start, calendar.day(2014, 12, 29)
  end

  def test_week_end_with_dow_1
    calendar = TickTack::Calendar.new(Date.new(2015, 1, 1), {
        dow: 1
    })
    assert_equal calendar.day.week_end, calendar.day(2015, 1, 4)
  end
end
