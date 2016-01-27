module TickTack
  class Day
    attr_accessor :year
    attr_accessor :month
    attr_accessor :day

    def initialize(year = nil, month = nil, day = nil)
      @year = year || TickTack.now.year
      @month = month || TickTack.now.month
      @day = day || TickTack.now.day
    end

    def date
      Date.new(year, month, day)
    end

    def ==(o)
      o.class == self.class &&
          o.year == year &&
          o.month == month &&
          o.day == day
    end
  end
end
