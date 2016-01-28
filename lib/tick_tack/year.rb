module TickTack
  class Year
    include TickTack::Scope::Year

    def initialize(year_i = nil)
      init_year(year_i)
    end

    def first_day
      TickTack::Day.new(year_i, 1, 1)
    end

    def last_day
      TickTack::Day.new(year_i, 12, 31)
    end

    def month(month_i)
      Month.new(year_i, month_i)
    end

    def ==(o)
      o.class == self.class && o.year_i == year_i
    end
  end
end
