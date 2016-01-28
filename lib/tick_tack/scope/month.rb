module TickTack
  module Scope
    module Month
      include TickTack::Scope::Year

      attr_accessor :month_i

      def init_month(month_i = nil)
        @month_i = month_i || TickTack.now.month
      end

      def year
        TickTack::Year.new(year_i)
      end
    end
  end
end