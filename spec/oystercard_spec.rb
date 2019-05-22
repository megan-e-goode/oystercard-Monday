require 'oystercard'
require 'journey'

describe Oystercard do
  let(:setup) {
    subject.top_up(10)
    subject.touch_in("Moorgate")
  }

  it 'has a default balance of 0' do
    expect(subject.balance).to eq(0)
  end

  it 'can be topped up' do
    subject.top_up(10)
    expect(subject.balance).to eq(10)
  end

  it 'has a limit of £90' do
    subject.top_up(90)
    expect{ subject.top_up(10) }.to raise_error "limit is £#{Oystercard::LIMIT}"
  end

  it 'prevents journey if balance too low' do
    expect{ subject.touch_in("Moorgate") }.to raise_error "not enough funds"
  end

  it 'can record touch in travel history' do
    setup
    expect(subject.history.length).to eq(1)
  end

  it 'can record full history of a single journey' do
    setup
    subject.touch_out("Canada Water")
    expect(subject.history).to eq([{tap_in_station: "Moorgate", tap_out_station: "Canada Water"}])
  end

  it 'has an empty list of journeys by default' do
    expect(subject.history).to eq([])
  end

  it 'touch in creates new journey' do
    setup
    expect(subject.journey).to be_an_instance_of(Journey)
  end

  it 'touch out ends the journey' do
    setup
    subject.touch_out("Kings Cross")
    expect(subject.journey.in_journey).to be false
  end

  it 'can charge a minimum fare' do
    setup
    subject.touch_out("Kings Cross")
    expect{ subject.fare }.to change{ subject.balance }.by(-Oystercard::MINIMUM_FARE)
  end

  it 'can charge a penalty fare when you do not touch out' do
    setup
    expect{ subject.fare }.to change{ subject.balance }.by(-Oystercard::PENALTY_FARE)
  end

  it 'can charge a penalty fare when you do not touch in' do
    subject.top_up(90)
    subject.touch_out("Kings Cross")
    expect{ subject.fare }.to change{ subject.balance }.by(-Oystercard::PENALTY_FARE)
  end

end
