module TickTack
  class Day
    include TickTack::Scope::Day

    def initialize(calendar, year_i = nil, month_i = nil, day_i = nil)
      @calendar = calendar
      init_year(year_i)
      init_month(month_i)
      init_day(day_i)
    end

    def date
      Date.new(year_i, month_i, day_i)
    end

    def ==(o)
      o.class == self.class &&
          o.year_i == year_i &&
          o.month_i == month_i &&
          o.day_i == day_i
    end
  end
end
