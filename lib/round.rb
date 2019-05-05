class Round

  attr_reader :deck, :turns, :number_correct
  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    @new_turn = Turn.new(guess, current_card)
    @deck.cards.rotate!
    @turns << @new_turn

      if @new_turn.correct?
        @number_correct+= 1
      end
    return @new_turn
  end
    #if turn correct, add to correct count
    # add current turn to turn array

  def number_correct_by_category(category)

    num_correct_by_category = 0

    @turns.each do |turn|
      if turn.card.category == category && turn.correct?
        num_correct_by_category += 1
      end
    end
      return num_correct_by_category

      # look through turns[]
      # look for category and correctness
      # increase num correct by cat by 1
  end

  def percent_correct
    @number_correct.to_f / @turns.length * 100
  end

  def percent_correct_by_category(category)
    number_correct_by_category(category).to_f / @deck.cards_in_category(category).length * 100
  end

  def start
    "Welcome! You're playing with 4 cards"
  end
end
