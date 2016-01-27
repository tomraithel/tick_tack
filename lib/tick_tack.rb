require 'date'

require 'tick_tack/version'
require 'tick_tack/year'
require 'tick_tack/month'

module TickTack
  @now = Date.new

  def self.now=(now)
    @now = now
  end

  def self.now
    @now
  end
end
