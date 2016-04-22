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
    add_journey
  end

  def finish(station)
    journey.finish(station)
    add_journey
  end

  private

  def current_journey
    return journey if !journey.complete?
    @journey = Journey.new
  end

  def add_journey
   return @journeys << current_journey if !journey.complete?
    @journeys
  end

end



