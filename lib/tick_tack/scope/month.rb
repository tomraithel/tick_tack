module TickTack
  module Scope
    module Month
      include TickTack::Scope::Year

      attr_accessor :month_i

      def init_month(month_i = nil)
        @month_i = month_i || @calendar.now.month
      end

      def year
        @calendar.year(year_i)
      end
    end
  end
end