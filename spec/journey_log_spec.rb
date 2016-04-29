require 'journey_log'

describe JourneyLog do


let(:journey){ double :journey }
let(:station){ double :station }
let(:journey_class) {double :journey_class, new: journey}
let(:journey_log) {described_class.new}


  describe '#start' do
    it 'starts a journey' do
      journey_log.start(station)
      expect(journey_log.journeys.last.entry_station).not_to eq nil
    end
  end

  describe '#finish' do
    it 'finishes a journey' do
      journey_log.start(station)
      journey_log.finish(station)
      expect(journey_log.journeys.last.exit_station).not_to eq nil
    end
  end

end


 #a private method #current_journey should return an incomplete journey or create a new journey
