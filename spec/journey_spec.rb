require 'journey'

describe Journey do

  subject(:journey) {described_class.new(:starting_station)}

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

  describe '#fare' do



  end
end