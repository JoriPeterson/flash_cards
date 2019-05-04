gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require 'pry'

class DeckTest < Minitest::Test

  def setup
      @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      @cards = [@card_1, @card_2, @card_3]

      @deck = Deck.new(@cards)
  end

  def test_the_deck_exists
      assert_instance_of Deck, @deck
      assert_equal [@card_1, @card_2, @card_3], @deck.cards
  end

  def test_the_first_card_is_card_1
      assert_equal @card_1, @deck.cards.first
  end

  def test_that_it_has_3_cards
      assert_equal 3, @deck.count_cards
  end

  def test_it_returns_the_category_STEM
      assert_equal [@card_2, @card_3], @deck.cards_in_category(:STEM)
  end

  def test_it_returns_the_category_Geography
      assert_equal [@card_1], @deck.cards_in_category(:Geography)
  end

  def test_it_returns_an_empty_array_if_category_does_not_exist
      assert_equal [], @deck.cards_in_category(:Pop_Culture)
  end
end
