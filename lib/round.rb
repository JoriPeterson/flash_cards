class Round

  attr_reader :deck, :turns, :number_correct, :number_correct_by_category
  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @number_correct_by_category = 0
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    @new_turn = Turn.new(guess, current_card)
    @deck.cards.rotate
    @turns << @new_turn

      if @new_turn.correct?
        @number_correct+= 1
      end
    return @new_turn
  end
    #if turn correct, add to correct count
    # add current turn to turn array

  def number_correct_by_category(category)
    if category && correct?
      @number_correct_by_category += 1
    end
  end

  def percent_correct
    @number_correct.to_f / @turns.length * 100
  end

  def percent_correct_by_category(category)
    @number_correct_by_category.to_f / cards_in_category(category) * 100
  end
end
