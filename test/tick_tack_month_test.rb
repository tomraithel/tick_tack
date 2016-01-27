require 'test_helper'

class TickTackMonthTest < Minitest::Test
  def setup
    TickTack.now = Date.new(2015, 5, 27)
    @month = TickTack::Month.new
  end

  def test_that_it_defaults_to_now_month
    assert_equal @month.year, 2015
    assert_equal @month.month, 5
  end

  def test_that_year_can_be_overwritten
    m = TickTack::Month.new(2013)
    assert_equal m.year, 2013
    m.year = 2014
    assert_equal m.year, 2014
  end

  def test_that_month_can_be_overwritten
    m = TickTack::Month.new(2013, 11)
    assert_equal m.month, 11
    m.month = 1
    assert_equal m.month, 1
  end

  def test_first_day_of_month
    assert_equal @month.first_day, Date.new(2015, 5, 1)
  end

  def test_last_day_of_year
    [
        [TickTack::Month.new(2016, 1), Date.new(2016, 1, 31)],
        [TickTack::Month.new(2016, 2), Date.new(2016, 2, 29)],
        [TickTack::Month.new(2016, 4), Date.new(2016, 4, 30)],
    ].each do |test|
      assert_equal test[0].last_day, test[1]
    end
  end

  def test_equality
    m = TickTack::Month.new
    assert_equal @month, m
  end
  #
  # def test_get_month
  #   assert_equal @y.month(0), TickTack::Month.new(2015, 0)
  # end
end
