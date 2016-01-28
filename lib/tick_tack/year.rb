module TickTack
  class Year
    include Comparable
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

    def months
      (1..12).map do |i|
        month(i)
      end
    end

    def contains?(other)
      range = (first_day.date.jd..last_day.date.jd)
      if other.is_a? Month
        range === other.first_day.date.jd
      elsif other.is_a? Day
        range === other.date.jd
      else
        false
      end
    end

    def next
      next_date = @first_day_date.next_year
      @calendar.year(next_date.year)
    end
    alias_method :succ, :next

    def previous
      prev_date = @first_day_date.prev_year
      @calendar.year(prev_date.year)
    end
    alias_method :prev, :previous

    def <=>(other)
      self.first_day.date <=> other.first_day.date
    end
  end
end
