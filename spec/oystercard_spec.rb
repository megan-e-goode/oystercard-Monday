require 'oystercard'
require 'journey'

describe Oystercard do
  let(:oyster) { Oystercard.new(journeylog) }
  let(:journeylog) { double(:journeylog, :start_journey => true, :end_journey => false) }

  it 'has a default balance of 0' do
    expect(oyster.balance).to eq(0)
  end

  it 'can be topped up' do
    oyster.top_up(10)
    expect(oyster.balance).to eq(10)
  end

  it 'has a limit of £90' do
    oyster.top_up(90)
    expect{ oyster.top_up(10) }.to raise_error "limit is £#{Oystercard::LIMIT}"
  end

  it 'prevents journey if balance too low' do
    expect{ oyster.touch_in("Moorgate") }.to raise_error "not enough funds"
  end

  it 'touch in starts the journey' do

  end

  it 'touch out ends the journey' do

  end

  it 'can charge a minimum fare' do
    oyster.top_up(10)
    oyster.touch_in("Barbican")
    oyster.touch_out("Kings Cross")
    expect{ oyster.fare }.to change{ oyster.balance }.by(-Oystercard::MINIMUM_FARE)
  end

  it 'can charge a penalty fare when you do not touch out' do
    allow(journeylog).to receive(:nil?).and_return(true)
    oyster.top_up(10)
    oyster.touch_in("Barbican")
    expect{ oyster.fare }.to change{ oyster.balance }.by(-Oystercard::PENALTY_FARE)
  end

  it 'can charge a penalty fare when you do not touch in' do
    allow(journeylog).to receive(:nil?).and_return(true)
    oyster.top_up(90)
    oyster.touch_out("Kings Cross")
    expect{ oyster.fare }.to change{ oyster.balance }.by(-Oystercard::PENALTY_FARE)
  end

  it 'tells journey_log to begin journey' do

  end

end
