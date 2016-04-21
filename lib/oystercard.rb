require_relative 'journey'

class Oystercard

  BALANCE_LIMIT = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1

  attr_reader :balance, :journeys

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
   fail "balance should not exceed £#{BALANCE_LIMIT}" if reach_limit?(amount)
    @balance += amount
  end

  def touch_in(journey = Journey.new(station))
    touch_out(nil) unless (new_card? || journeys.last.complete)
    fail "insufficient balance" if @balance < MINIMUM_BALANCE
    journeys << journey
  end

  def touch_out(station, journey = Journey.new(nil) )
      touch_in(journey) if (new_card? || journeys.last.complete)
      journeys.last.finish(station)
      deduct(journeys.last.fare)

  end

  private

  def deduct(fare)
   @balance -= fare
  end

  def reach_limit?(amount)
    @balance + amount > BALANCE_LIMIT
  end

  def new_card?
    journeys.empty?
  end

end
