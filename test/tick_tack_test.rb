require 'test_helper'

class TickTackTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::TickTack::VERSION
  end

  def test_that_it_defines_year
    refute_nil ::TickTack::Year
  end

  def test_that_it_defines_month
    refute_nil ::TickTack::Month
  end

  def test_that_it_defines_day
    refute_nil ::TickTack::Day
  end
end
