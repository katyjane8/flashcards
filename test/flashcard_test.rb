require 'minitest/autorun'
require 'minitest/pride'
require './lib/flashcards'

class CardTest < Minitest::Test
  def test_card_exists
    card = Card.new("What is the capital of Alaska", "Juneau")

    assert_instance_of Card, card.question
  end
end
