class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  attr_reader :starting_station, :exit_station

  def initialize(starting_station = nil)
    @starting_station = starting_station
    @exit_station = nil
  end

  def end_journey(exit_station)
    @exit_station = exit_station
    self
  end

  def complete?
    !!starting_station && !!exit_station
  end

  def fare
    return MINIMUM_FARE if complete?
    PENALTY_FARE
  end

  private



end