require 'journey'

describe Journey do

  subject(:journey) {described_class.new(:starting_station)}
  subject(:journey_no_start) {described_class.new}

  it 'stores minimum fare as a cosntant' do
    expect(Journey::MINIMUM_FARE).to eq 1
  end

  it 'has a starting station' do
    expect(journey.starting_station).to eq :starting_station
  end

  it '#end_journey' do
    journey.end_journey(:exit_station)
    expect(journey.exit_station).to eq :exit_station
  end

  it 'returns false if journey is not complete' do
    expect(journey.complete?).to eq false
  end

  describe '#fare' do
    it 'deducts penalty fare if no start station' do
      expect(journey_no_start.fare).to eq Journey::PENALTY_FARE
    end

    it 'deducts penalty fare if no exit_station station' do
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end




  end
end