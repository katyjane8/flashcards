require 'minitest/autorun'
require 'minitest/pride'
require './lib/cards'
require './lib/guesses'
require './lib/deck'
require './lib/round'

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

  def test_new_guesses_and_answers
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)

    assert_instance_of Card, guess.card
    assert_equal "Saturn", guess.response
    assert_equal false, guess.correct?
    assert_equal "Incorrect.", guess.feedback
  end

  def test_deck
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west")
    deck = Deck.new([card_1, card_2, card_3])

    assert_equal [card_1, card_2, card_3], deck.cards
    assert_equal 3, deck.count
  end

  def test_a_round_of_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_instance_of Deck, round.deck
    assert_equal [], round.guesses
  end

  def test_current_card
    skip
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal Card, round.current_card
  end

end
