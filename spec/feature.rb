require './lib/oystercard.rb'

card = Oystercard.new
card.top_up(10)
card.deduct(9.5)
card.touch_in
card.journey
card.touch_out
card.journey

card.touch_in #give me an error, not enough funds
