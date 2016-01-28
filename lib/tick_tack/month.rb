module TickTack
  class Month
    include TickTack::Scope::Month

    def initialize(calendar, year_i = nil, month_i = nil)
      @calendar = calendar

      init_year(year_i)
      init_month(month_i)
    end

    def first_day
      @calendar.day(year_i, month_i, 1)
    end

    def last_day
      date = (first_day.date >> 1) - 1
      @calendar.day(year_i, month_i, date.day)
    end

    def day(day_i)
      @calendar.day(year_i, month_i, day_i)
    end

    def ==(o)
      o.class == self.class &&
          o.year_i == year_i &&
          o.month_i == month_i
    end
  end
end
