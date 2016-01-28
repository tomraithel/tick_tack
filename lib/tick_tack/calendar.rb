module TickTack
  class Calendar

    attr_reader :conf

    def initialize(now = nil, conf = {})
      self.now = now
      @conf = {
        dow: 0 # day of week - 0 = sunday, 1 = monday
      }.merge!(conf)
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
