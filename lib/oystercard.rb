require_relative 'journey_log'
class Oystercard


  BALANCE_LIMIT = 90
  MINIMUM_FARE = 1
  attr_reader :balance, :journey, :journey_log

	def initialize(journey_log = JourneyLog.new)
		@balance = 0
    @journey_log = journey_log
	end


  def top_up(amount)
    fail "Your balance cannot exceed £#{BALANCE_LIMIT}" if (amount + balance) > BALANCE_LIMIT
    @balance += amount
  end

  def touch_in(entry_station)
  	fail "You do not have the minimum balance for travel" if @balance < MINIMUM_FARE
    journey_log.start(entry_station)
  end

  # def touch_out(exit_station)
  #   journey_log.finish(exit_station)
  #   deduct journey.fare
  # end

  private

  def deduct(amount)
    @balance -= amount
  end

end