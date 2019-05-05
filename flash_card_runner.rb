require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'


@card_1 = Card.new("What is 5 + 5?", "10", :STEM)
@card_2 = Card.new("What is Rachel's favorite animal?", "rabbit", :Staff)
@card_3 = Card.new("What is Mike's middle name?", "nobody knows", :Staff)
@card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :Pop_Culture)

@deck = Deck.new([@card_1, @card_2, @card_3, @card_4])
@round = Round.new(@deck)



p @round.start
p "-------------------------------"

for this_deck in 0..3 do

p "This is card number #{@round.turns.length + 1} out of 4."
p "Question: #{@round.current_card.question}"

@guess = gets.chomp
my_turn = @round.take_turn(@guess)
p my_turn.feedback

end


p "****** Game Over! ******"

p "You had #{@round.number_correct} correct guesses out of #{@round.turns.count} for a total score of #{@round.percent_correct}%."
p "STEM - #{@round.percent_correct_by_category(:STEM)} correct"
p "Turing Staff - #{@round.percent_correct_by_category(:Staff)} correct"
p "Pop Culture - #{@round.percent_correct_by_category(:Pop_Culture)} correct"
