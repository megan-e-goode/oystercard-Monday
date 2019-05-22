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

  it 'can pay for travel' do
    card = Oystercard.new(50)
    card.touch_in("b")
    card.touch_out("a", 40)
    expect(card.balance).to eq(10)
  end

  it 'prevents journey if balance too low' do
    expect{ subject.touch_in("Moorgate") }.to raise_error "not enough funds"
  end

  it 'charges a minimum fare' do
    setup
    expect{ subject.touch_out("a") }.to change{ subject.balance }.by(-Oystercard::MINIMUM_FARE)
  end

  it 'can store the entry_station at tap in' do
    setup
    expect(subject.entry_station).to eq("Moorgate")
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

end
