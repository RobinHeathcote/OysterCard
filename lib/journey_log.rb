require 'journey'
require 'oystercard'

class JourneyLog

  attr_reader :journey_class

  def initialize(journey_class: card = Oystercard.new  )
    @journey_class = journey_class
    @journeys = []
  end

  def start(station)

  end


end



