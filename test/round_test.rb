gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

class RoundTest < Minitest::Test

  def setup
      @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      @deck = Deck.new([@card_1, @card_2, @card_3])
      @round = Round.new(@deck)
      @turn_1 = Turn.new("Juneau", @card_1)
  end

  def test_that_it_exists
    assert_instance_of Round, @round
  end

  def test_deck_has_a_round
      assert_equal @deck, @round.deck
  end

  def test_round_starts_with_empty_turn_array
      assert_equal [], @round.turns
  end

  def test_current_card_is_first_in_array
      assert_equal @card_1, @round.current_card
  end

  def test_take_turn_creates_new_turn
    @new_turn = @round.take_turn("Juneau")

    assert_equal "Juneau", @turn_1.card.answer
    assert_instance_of Turn, @new_turn
  end

  def test_take_turn_rotates_card
    assert @round.current_card, @card_1
    @round.take_turn("Juneau")
    assert @round.current_card, @card_2
  end

  def test_new_turn_guess_is_correct
    @new_turn = @round.take_turn("Juneau")
    assert @new_turn.correct?
    @new_turn = @round.take_turn("Saturn")
    refute @new_turn.correct?
  end

  def test_turns_array_has_new_card
    @enew_turn = @round.take_turn("Juneau")
    assert_equal @round.turns.length, 1
  end

  def test_correct_count_increases_if_correct
    @enew_turn = @round.take_turn("Juneau")
    assert_equal 1, @round.number_correct
  end

  def test_take_turn_method_overall
    assert @round.current_card, @card_1
    @round.take_turn("Juneau")
    assert @round.current_card, @card_2
    @round.take_turn("Venus")
    assert @round.turns.count, 2
    assert @round.turns.last.feedback, "Incorrect"
    assert @round.number_correct, 1
    assert @round.current_card, @card_3
  end

  def number_correct_by_category_returns_number_correct_and_percent
    assert @round.current_card, @card_1
    @round.take_turn("Juneau")
    assert @round.number_correct_by_category(:Geography), 1
    assert @round.number_correct_by_category(:STEM), 0
    assert @round.percent_correct, 50.0
    assert @round.percent_correct_by_category(:Geography), 100.0
  end
end
