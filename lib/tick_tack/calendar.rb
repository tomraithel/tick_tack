module TickTack
  class Calendar

    @now = nil

    def initialize(now = nil)
      self.now = now
    end

    def now=(now)
      @now = now
    end

    def now
      @now.nil? ? Date.new : @now
    end

    def year(*args)
      self.class.factory(:Year).new(self, *args)
    end

    def month(*args)
      self.class.factory(:Month).new(self, *args)
    end

    def day(*args)
      self.class.factory(:Day).new(self, *args)
    end

    protected

    def self.factory class_id
      {
        :Year => Year,
        :Month => Month,
        :Day => Day
      }[class_id]
    end
  end
end
