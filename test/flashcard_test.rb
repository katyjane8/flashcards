require 'minitest/autorun'
require 'minitest/pride'
require './lib/cards'
require './lib/guesses'

class CardTest < Minitest::Test
  def test_card_exists
    card = Card.new("What is the capital of Alaska", "Juneau")

    assert_instance_of Card, card
  end

  def test_card_question
    card = Card.new("What is the capital of Alaska", "Juneau")

    assert_equal "What is the capital of Alaska", card.question
  end

  def test_card_answer
    card = Card.new("What is the capital of Alaska", "Juneau")

    assert_equal "Juneau", card.answer
  end

  def test_guess_from_card
    card = Card.new("What is the capital of Alaska", "Juneau")
    guess = Guess.new("Juneau", card)

    assert_instance_of Card, guess.card
  end
  def test_response_from_guess
    card = Card.new("What is the capital of Alaska", "Juneau")
    guess = Guess.new("Juneau", card)

    assert_equal "Juneau", guess.response
  end

  def test_that_guess_is_correct
    card = Card.new("What is the capital of Alaska", "Juneau")
    guess = Guess.new("Juneau", card)

    assert_equal true, guess.correct?
  end

  def test_that_guess_can_issue_feedback
    card = Card.new("What is the capital of Alaska", "Juneau")
    guess = Guess.new("Juneau", card)

    assert_equal "Correct!", guess.feedback
  end

  

end
