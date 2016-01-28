module TickTack
  module Scope
    module Day
      include TickTack::Scope::Month

      attr_accessor :day_i

      def init_day(day_i = nil)
        @day_i = day_i || TickTack.now.day
      end

      def month
        TickTack::Month.new(year_i, month_i)
      end
    end
  end
end