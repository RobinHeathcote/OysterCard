require_relative 'journey'
require_relative 'oystercard'
require_relative 'station'

class JourneyLog

  attr_reader :journey_class, :journey, :station

  def initialize(journey_class: journey = Journey.new)
    @journey_class = journey_class
    @journeys = []
    @journey = journey

  end

  def start(station)
    @entry_station = station
  end


end



