require 'test_helper'

class TickTackMonthTest < Minitest::Test
  def setup
    @calendar = TickTack::Calendar.new(Date.new(2015, 5, 27))
    @month = @calendar.month
  end

  def test_default_getters
    assert_equal @month.year_i, 2015
    assert_equal @month.month_i, 5
  end

  def test_overwrite_year
    m = @calendar.month(2013)
    assert_equal m.year_i, 2013
    m.year_i = 2014
    assert_equal m.year_i, 2014
  end

  def test_overwrite_month
    m = @calendar.month(2013, 11)
    assert_equal m.month_i, 11
    m.month_i = 1
    assert_equal m.month_i, 1
  end

  def test_first_day_of_month
    assert_equal @month.first_day, @calendar.day(2015, 5, 1)
  end

  def test_last_day_of_month
    [
        [@calendar.month(2016, 1), @calendar.day(2016, 1, 31)],
        [@calendar.month(2016, 2), @calendar.day(2016, 2, 29)],
        [@calendar.month(2016, 4), @calendar.day(2016, 4, 30)],
    ].each do |test|
      assert_equal test[0].last_day, test[1]
    end
  end

  def test_compare
    bigger_month = @calendar.month(2015, 6)
    assert bigger_month > @month
    assert @month < bigger_month
    assert bigger_month == bigger_month
  end

  def test_get_day
    assert_equal @month.day(12), @calendar.day(2015, 5, 12)
  end

  def test_get_year
    assert_equal @month.year, @calendar.year(2015)
  end

  def test_weeksdays
    weeks = @month.weekdays
    assert_same weeks.length, 6
    weeks.each do |days|
      assert_same days.length, 7
    end
    assert_equal weeks[0].first, @calendar.day(2015, 4, 26)
    assert_equal weeks[5].last, @calendar.day(2015, 6, 6)
  end

  def test_weekdays_with_dow_1
    calendar = TickTack::Calendar.new(Date.new(2015, 5, 27), {
        dow: 1
    })
    weeks = calendar.month.weekdays
    assert_same weeks.length, 5

    assert_equal weeks[0].first, calendar.day(2015, 4, 27)
    assert_equal weeks[4].last, calendar.day(2015, 5, 31)
  end

  def test_next_month
    next_month = @month.next
    assert_equal next_month, @calendar.month(2015, 6)
  end

  def test_prev_month
    prev_month = @month.prev
    assert_equal prev_month, @calendar.month(2015, 4)
  end

  def test_contains?
    assert @month.contains?(@calendar.day(2015, 5, 31))
    assert @month.contains?(@calendar.day(2015, 5, 1))
    refute @month.contains?(@calendar.day(2015, 4, 29))
    refute @month.contains?(@calendar.day(2014, 12, 31))
  end
end
