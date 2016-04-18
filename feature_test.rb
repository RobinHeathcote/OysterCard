require './lib/oystercard'

#Initialize objects
card = OysterCard.new


#Scenario_01
card.top_up(80)
p card.balance #Expect eq 80
card.top_up(20)
p card.balance #Expect eq 100