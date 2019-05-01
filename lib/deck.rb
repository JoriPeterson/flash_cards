class Deck

    attr_reader :cards
    def initialize(cards)
      @cards = cards
    end

    def count
      cards.count
    end

    def cards_in_category(category)
      # return array of the specific category called
      ret = []
      cards.each do |card|
        if card.category == category
          ret.push(card)
        end
      end

      return ret

      # cards.select{ |card| card.category == category }
    end

end
