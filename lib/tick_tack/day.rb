module TickTack
  class Day
    attr_accessor :year_i
    attr_accessor :month_i
    attr_accessor :day_i

    def initialize(year_i = nil, month_i = nil, day_i = nil)
      @year_i = year_i || TickTack.now.year
      @month_i = month_i || TickTack.now.month
      @day_i = day_i || TickTack.now.day
    end

    def date
      Date.new(year_i, month_i, day_i)
    end

    def month
      TickTack::Month.new(year_i, month_i)
    end

    def year
      TickTack::Year.new(year_i)
    end

    def ==(o)
      o.class == self.class &&
          o.year_i == year_i &&
          o.month_i == month_i &&
          o.day_i == day_i
    end
  end
end
