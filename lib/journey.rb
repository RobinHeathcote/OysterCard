class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  attr_reader :complete


  def initialize(entry_station = nil)
    @entry_station = entry_station
    @exit_station = nil
    @complete = false
  end

  def finish(exit_station = nil)
    self.exit_station = exit_station
    self.complete = true
    self
  end

  def fare
    return MINIMUM_FARE if complete if @exit_station = exit_station
    PENALTY_FARE
  end

  private

  attr_accessor :exit_station

  attr_reader :entry_station

  attr_writer :complete



end