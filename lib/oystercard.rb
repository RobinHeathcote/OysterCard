class Oystercard

  BALANCE_LIMIT = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 2
  attr_reader :balance

  def initialize
    @balance = 0
    @status = false
  end

  def top_up(amount)
    @amount = amount

   fail "balance should not exceed £#{BALANCE_LIMIT}"  if reach_limit?
   @balance += amount
  end

  def in_journey?
     @status
  end

  def touch_in(station)
    fail "insufficient balance" if @balance < MINIMUM_BALANCE
    @status = true
    in_journey?
  end

  def touch_out
    @status = false
    in_journey?
    deduct(MINIMUM_FARE)
  end

  private

  def deduct(amount)
   @balance -= amount
  end

  def reach_limit?
    @balance + @amount > BALANCE_LIMIT
  end

end
