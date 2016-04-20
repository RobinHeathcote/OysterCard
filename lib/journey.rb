class Journey

  MINIMUM_FARE = 1

  attr_reader :starting_station, :exit_station

  def initialize(starting_station)
    @starting_station = starting_station
    @exit_station = nil
  end

  def end_journey(exit_station)
    @exit_station = exit_station
  end
end