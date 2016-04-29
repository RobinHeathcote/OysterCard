require 'journey'
require 'oystercard'

describe Journey do
  subject(:journey) { described_class.new}
  let(:station) { double :station, zone: 1 }

  it "starts a journey" do
    expect(journey.start(station)).to eq station
  end

  it "ends a journey" do
    journey.finish(station)
    expect(journey.exit_station).to eq station
  end

  context "Card has enough money" do

      it "return penalty fare if didn't touch in" do
        journey.finish(station)
        expect(journey.fare).to eq Journey::PENALTY_FARE
      end

      it "return penalty fare if didn't touch out" do
        journey.start(station)
        expect(journey.fare).to eq Journey::PENALTY_FARE
      end

      it "charge minimum fare if complete journey" do
        journey.start(station)
        journey.finish(station)
        expect(journey.fare).to eq Oystercard::MINIMUM_FARE

      end

      it "returns journey not complete" do
        expect(journey.complete?).to eq false
      end

      it "returns journey is complete" do
        journey.start(station)
        journey.finish(station)
        expect(journey.complete?).to eq true
      end

    end

end