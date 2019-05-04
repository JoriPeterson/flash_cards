gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  def test_it_exists
      assert_instance_of Card, @card
      assert_instance_of Turn, @turn
  end

  def test_it_has_a_card
      assert_equal @card, @turn.card
  end

  def test_it_has_a_guess
      assert_equal "Juneau", @turn.guess
  end

  def test_is_the_answer_correct?
      assert_equal true, @turn.correct?
  end

  def test_if_answer_is_correct_return_correct
      assert_equal "Correct!", @turn.feedback
  end

  def test_if_answer_is_incorrect_return_false
      card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
      turn = Turn.new("Saturn", card)
      assert_equal false, turn.correct?
  end

  def test_if_answer_is_incorrect_return_incorrect
      card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
      turn = Turn.new("Saturn", card)
      assert_equal "Incorrect!", turn.feedback
  end
end
