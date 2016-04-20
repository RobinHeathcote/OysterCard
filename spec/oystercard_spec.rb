require 'oystercard'

describe Oystercard do

  let(:station) {double :station}
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  let(:journey){ double :journey}
  subject(:card) {described_class.new}

  it {is_expected.to respond_to(:touch_in).with(1).argument}

  it {is_expected.to respond_to(:touch_out).with(1).argument}

  it "new cards have no journeys stored" do
     expect(card.journeys).to be_empty
  end

  it "can top up the balance" do
      expect {card.top_up 1 }.to change{ card.balance }.by 1
  end

  it 'raises an error if top up amount exceeds 90' do
    maximum_balance = Oystercard::BALANCE_LIMIT
    card.top_up(maximum_balance)
    expect { card.top_up 1 }.to raise_error "balance should not exceed £#{maximum_balance}"
  end

  it "stores a journey" do
    card.top_up(30)
    card.touch_in(journey)
    expect(card.journeys).to include journey
  end

  it "raises an error when balance is less than 1" do
    expect {card.touch_in(station) }.to raise_error "insufficient balance"
  end

  xit 'deducts minimum fare on touch out' do
      card.top_up(Oystercard::BALANCE_LIMIT)
      expect {card.touch_out station}.to change {card.balance}.by -Oystercard::MINIMUM_FARE
  end


end
