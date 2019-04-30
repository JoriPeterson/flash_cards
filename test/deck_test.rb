gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
