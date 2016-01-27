module TickTack
  class Year
    attr_accessor :year

    def initialize(year = nil)
      @year = year || TickTack.now.year
    end

    def first_day
      Date.new(year, 1, 1)
    end

    def last_day
      Date.new(year, 12, 31)
    end

    def month(month)
      Month.new(year, month)
    end

    def ==(o)
      o.class == self.class && o.year == year
    end
  end
end
