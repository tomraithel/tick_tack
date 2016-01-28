require 'test_helper'

class TickTackCalendarTest < Minitest::Test
  def setup
    @calendar = TickTack::Calendar.new(Date.new(2015, 5, 27))
  end

  def test_overwriting_now
    date = Date.new
    old_date = @calendar.now
    @calendar.now = date

    refute_same @calendar.now, old_date
    assert_same @calendar.now, date
  end

  def test_factories
    assert_same @calendar.year.class, TickTack::Year
    assert_same @calendar.month.class, TickTack::Month
    assert_same @calendar.day.class, TickTack::Day
  end
end
