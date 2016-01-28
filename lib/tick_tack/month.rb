module TickTack
  class Month
    attr_accessor :year_i
    attr_accessor :month_i

    def initialize(year_i = nil, month_i = nil)
      @year_i = year_i || TickTack.now.year
      @month_i = month_i || TickTack.now.month
    end

    def first_day
      TickTack::Day.new(year_i, month_i, 1)
    end

    def last_day
      date = (first_day.date >> 1) - 1
      TickTack::Day.new(year_i, month_i, date.day)
    end

    def day(day_i)
      TickTack::Day.new(year_i, month_i, day_i)
    end

    def year
      TickTack::Year.new(year_i)
    end

    def ==(o)
      o.class == self.class &&
          o.year_i == year_i &&
          o.month_i == month_i
    end
  end
end
