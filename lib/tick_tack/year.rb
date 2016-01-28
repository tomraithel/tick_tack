module TickTack
  class Year
    include TickTack::Scope::Year

    def initialize(calendar, year_i = nil)
      @calendar = calendar
      init_year(year_i)

      @first_day_date = Date.new(self.year_i, 1, 1)
    end

    def first_day
      @calendar.day(year_i, 1, 1)
    end

    def last_day
      date = (@first_day_date >> 12) - 1
      @calendar.day(year_i, date.month, date.day)
    end

    def month(month_i)
      @calendar.month(year_i, month_i)
    end

    def ==(o)
      o.class == self.class && o.year_i == year_i
    end
  end
end
