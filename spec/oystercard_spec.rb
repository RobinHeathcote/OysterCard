load "oystercard.rb"

describe Oystercard do

  subject(:oyster) { described_class.new }

  let(:journey) { double(:journey, start: station, finish: 20) }
  let(:station) { double :station }

  it 'instruct journey to end on touch out' do
      oyster.top_up(Oystercard::MINIMUM_FARE)
      oyster.touch_out(station)
      expect(oyster.journey_log.journeys.last.exit_station).to eq station

  end
  it 'touches in' do
    oyster.top_up(Oystercard::MINIMUM_FARE)
    oyster.touch_in(station)
    expect(oyster.journey_log.journeys.last.entry_station).to eq station
  end


  context "balance" do

		it "shows the balance as zero with initialized" do
	   expect(subject.balance).to eq 0
		end

	  it 'cannot top up above the balance limit' do
	    subject.top_up(Oystercard::BALANCE_LIMIT)
	    expect { subject.top_up 1}.to raise_error "Your balance cannot exceed £#{Oystercard::BALANCE_LIMIT}"
	  end
  end


  describe "Touching in and out" do

    context "No money on the card" do
      it "Does not allow travel below minimum balance" do
        expect {subject.touch_in(station)}.to raise_error "You do not have the minimum balance for travel"
      end
	 end
  end
end

