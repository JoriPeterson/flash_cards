class Turn

    attr_accessor :guess, :card
    def initialize (guess, card)
      @guess = guess
      @card = card
    end

    def correct?
      return guess == card.answer
    end

    def feedback
      if correct? == true
      return "Correct!"
      else
      return "Incorrect!"
      end
    end

end
