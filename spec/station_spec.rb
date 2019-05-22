require 'station'

describe Station do
  let(:station) { Station.new("Manor House", 2) }

  it 'can create a station' do
    expect(station).to be_an_instance_of(Station)
  end

  it 'can store the station zone' do
    expect(station.zone).to eq(2)
  end

  it 'can store the station name' do
    expect(station.name).to eq("Manor House")
  end
end
