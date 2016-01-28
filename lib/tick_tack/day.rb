module TickTack
  class Day
    include Comparable
    include TickTack::Scope::Day

    attr_reader :date

    def initialize(calendar, year_i = nil, month_i = nil, day_i = nil)
      @calendar = calendar
      init_year(year_i)
      init_month(month_i)
      init_day(day_i)

      @date = Date.new(self.year_i, self.month_i, self.day_i)
    end

    def week_start
      week_start = date - (date.wday - @calendar.conf[:dow]) % 7
      @calendar.day(week_start.year, week_start.month, week_start.day)
    end

    def week_end
      week_end = week_start.date + 6
      @calendar.day(week_end.year, week_end.month, week_end.day)
    end

    def weekdays
      (week_start..week_end).to_a
    end

    def next
      next_date = @date.next_day
      @calendar.day(next_date.year, next_date.month, next_date.day)
    end
    alias_method :succ, :next

    def previous
      prev_date = @date.prev_day
      @calendar.day(prev_date.year, prev_date.month, prev_date.day)
    end
    alias_method :prev, :previous

    def <=>(other)
      self.date <=> other.date
    end

    # def inspect
    #   "#{year_i}-#{month_i}-#{day_i}"
    # end

    private
  end
end
