require 'journey'

describe Journey do

  subject(:journey) {described_class.new(:entry_station)}
  subject(:journey_no_start) {described_class.new}

  it 'stores minimum fare as a cosntant' do
    expect(Journey::MINIMUM_FARE).to eq 1
  end

  it '#finish' do
    journey.finish
    expect(journey.complete).to eq true
  end

  it 'returns false if journey is not complete' do
    expect(journey.complete).to eq false
  end

  describe '#fare' do
    context 'given an entry station' do
      subject {described_class.new(:entry_station)}

      it 'deducts penalty fare if no start station' do
      expect(subject.fare).to eq Journey::PENALTY_FARE
      end
    end

    context 'given exit station' do

      subject {described_class.new(:exit_station)}

      it 'deducts penalty fare if no exit_station station' do
      expect(subject.fare).to eq Journey::PENALTY_FARE
      end
    end

  end
end