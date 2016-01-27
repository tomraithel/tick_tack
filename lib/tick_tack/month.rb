module TickTack
  class Month
    attr_accessor :year
    attr_accessor :month

    def initialize(year = nil, month = nil)
      @year = year || TickTack.now.year
      @month = month || TickTack.now.month
    end

    def first_day
      Date.new(year, month, 1)
    end

    def last_day
      (first_day >> 1) - 1
    end

    def ==(o)
      o.class == self.class &&
          o.year == year &&
          o.month == month
    end
  end
end
