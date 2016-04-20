require 'station'

describe Station do
  subject(:station) {described_class.new(:station, :zone) }

it 'has a name' do
expect(station.name).to eq :station
end

it 'has a zone' do
  expect(station.zone).to eq :zone
end

end
