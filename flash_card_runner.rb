require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class Game
  attr_reader :start
  def initialize
    @start =
  "Welcome! You're playing with 4 cards.
  --------------------------------------------
  This is card number 1 out of 4.
  Question: What is 5 + 5"
  end
end

new_game = Game.new
puts new_game.start




# @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
# @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
# @deck = Deck.new([@card_1, @card_2, @card_3])
# @round = Round.new(@deck)
# @turn = Turn.new("Juneau", @card)
