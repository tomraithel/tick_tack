require 'test_helper'

class TickTackTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::TickTack::VERSION
  end

  def test_overwriting_now
    date = Date.new
    old_date = ::TickTack.now
    ::TickTack.now = date

    refute_same ::TickTack.now, old_date
    assert_same ::TickTack.now, date
  end

  def test_that_it_defines_year
    refute_nil ::TickTack::Year
  end

  def test_that_it_defines_month
    refute_nil ::TickTack::Month
  end
end
