require 'minitest/autorun'
require 'minitest/pride'
require './lib/guesses'

class GuessTest < Minitest::Test

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

  def test_new_guesses_and_answers
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)

    assert_instance_of Card, guess.card
    assert_equal "Saturn", guess.response
    assert_equal false, guess.correct?
    assert_equal "Incorrect.", guess.feedback
  end
end
