require './lib/oystercard.rb'

card = Oystercard.new
card.top_up(10)


card.touch_in("Moorgate")
card.entry_station # => Moorgate
card.touch_in("a")
