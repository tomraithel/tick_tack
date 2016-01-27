require 'date'

require 'tick_tack/version'
require 'tick_tack/year'
require 'tick_tack/month'
require 'tick_tack/day'

module TickTack
  @now = nil

  def self.now=(now)
    @now = now
  end

  def self.now
    @now.nil? ? Date.new : @now
  end
end
