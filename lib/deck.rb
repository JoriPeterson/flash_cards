class Deck

    attr_reader :cards
    def initialize(cards)
      @cards = cards
    end

    def count
      @cards.count
    end

    def cards_in_category(category)
      # return array of the specific category called
      cat_deck = []
      @cards.each do |card|
        if card.category == category
          cat_deck.push(card)
        end
      end

      return cat_deck

      # cards.select{ |card| card.category == category }
    end

end
