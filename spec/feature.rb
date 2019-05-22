require './lib/journey.rb'
require './lib/oystercard.rb'


card = Oystercard.new
card.top_up(10)


card.touch_in("Moorgate")
card.touch_out("Camden Town")
card.history
card.fare
