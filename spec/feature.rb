require './lib/oystercard.rb'

card = Oystercard.new
card.top_up(10)
card.deduct(5)
card.touch_in
card.journey?
