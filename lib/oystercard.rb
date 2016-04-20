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
    fail "insufficient balance" if @balance < MINIMUM_BALANCE
    @journeys << journey
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
  end

  private

  def deduct(amount)
   @balance -= amount
  end

  def reach_limit?(amount)
    @balance + amount > BALANCE_LIMIT
  end

end
