require_relative 'journey'
require_relative 'oystercard'
require_relative 'station'

class JourneyLog

  attr_reader :station, :journeys, :journey

  def initialize(journey_class = Journey.new)
    @journeys = []
    @journey = journey_class

  end

  def start(station)
    journey.start(station)
    close_journey
  end

  def finish(station)
    journey.finish(station)
    close_journey
  end

  private

  def current_journey
    return @journey if !journey.complete?

  end

  def close_journey
    if journey.complete?
      @journeys << journey
      @journey = Journey.new
    else
      @journey = Journey.new(station)
    end
  end

end



