module TickTack
  class Month
    include Comparable
    include TickTack::Scope::Month

    def initialize(calendar, year_i = nil, month_i = nil)
      @calendar = calendar

      init_year(year_i)
      init_month(month_i)

      @first_day_date = Date.new(self.year_i, self.month_i, 1)
    end

    def first_day
      @calendar.day(year_i, month_i, 1)
    end

    def last_day
      date = (@first_day_date >> 1) - 1
      @calendar.day(year_i, month_i, date.day)
    end

    def day(day_i)
      @calendar.day(year_i, month_i, day_i)
    end

    def weeks
      first = first_day.week_start
      last = last_day.week_end
      weeks = []

      while first < last
        weeks << (first..first.week_end)
        first = first.week_end.next
      end

      weeks
    end

    def <=>(other)
      self.first_day.date <=> other.first_day.date
    end
  end
end
