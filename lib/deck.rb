class Deck

    attr_reader :cards
    def initialize(cards)
      @cards = cards
    end

    def count_cards
      @cards.count
    end

    def cards_in_category(category)
      # return array of the specific category called

      @cards.select do |card|
        card.category == category
      end
    end
end

      # cards.select{ |card| card.category == category }
