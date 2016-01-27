module TickTack
  class Month
    attr_accessor :year
    attr_accessor :month

    def initialize(year = nil, month = nil)
      @year = year || TickTack.now.year
      @month = month || TickTack.now.month
    end

    def first_day
      TickTack::Day.new(year, month, 1)
    end

    def last_day
      date = (first_day.date >> 1) - 1
      TickTack::Day.new(year, month, date.day)
    end

    def day(day)
      TickTack::Day.new(year, month, day)
    end

    def ==(o)
      o.class == self.class &&
          o.year == year &&
          o.month == month
    end
  end
end
