require 'oystercard'

describe Oystercard do

  let(:station) {double :station}
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
# let(:card_balance) {double(:card, balance: Oystercard::BALANCE_LIMIT, entry_station: station)}
  let(:journey){ {entry_station: entry_station, exit_station: exit_station} }
  subject(:card) {described_class.new}

  it "can top up the balance" do
      expect {card.top_up 1 }.to change{ card.balance }.by 1
  end

  it 'raises an error if top up amount exceeds 90' do
      maximum_balance = Oystercard::BALANCE_LIMIT
      card.top_up(maximum_balance)
      expect { card.top_up 1 }.to raise_error "balance should not exceed £#{maximum_balance}"
  end

  it {is_expected.to respond_to(:in_journey?)}

  it "For a new card, in journey returns false" do
      expect(card).not_to be_in_journey
  end

  it{is_expected.to respond_to(:touch_in).with(1).argument}

  it "starts journey with touch in" do
      card.top_up(12)
      card.touch_in(station)
      expect(card).to be_in_journey
  end

  it{is_expected.to respond_to(:touch_out).with(1).argument}

  it "ends journey with touch out" do
      card.top_up(30)
      card.touch_in(station)
      card.touch_out(station)
      expect(card).not_to be_in_journey
  end

  it "raises an error when balance is less than 1" do
      expect {card.touch_in(station) }.to raise_error "insufficient balance"
  end

  it 'deducts minimum fare on touch out' do
      card.top_up(Oystercard::BALANCE_LIMIT)
      expect {card.touch_out station}.to change {card.balance}.by -Oystercard::MINIMUM_FARE
  end

  it 'stores the entry station' do
      card.top_up(80)
      card.touch_in(station)
      expect(card.entry_station).to eq station
  end

  it "new cards have no journeys stored" do
     expect(card.journeys).to be_empty
  end

  it "stores a journey" do
      card.top_up(30)
      card.touch_in(entry_station)
      card.touch_out(exit_station)
      expect(card.journeys).to include journey

  end
end
