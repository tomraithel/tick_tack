module TickTack
  module Scope
    module Year
      attr_accessor :year_i

      def init_year(year_i = nil)
        @year_i = year_i || TickTack.now.year
      end
    end
  end
end
