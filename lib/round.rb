class Round

  attr_reader :deck, :turns, :count
  def initialize(deck)
    @deck = deck
    @turns = []
    @count = 0
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    @new_turn = Turn.new(guess, current_card)
    @deck.cards.rotate
    @turns << @new_turn

      if @new_turn.correct?
        @count += 1
      end
    return @new_turn
  end
    #if turn correct, add to correct count
    # add current turn to turn array

end
