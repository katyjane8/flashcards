require_relative 'deck'
require_relative 'guesses'

class Round
  attr_reader :deck, :guesses
  attr_accessor :index

  def initialize(deck)
    @deck = deck
    @guesses = []
    @index = 0
    @count = 0
  end

  def current_card
    deck.cards[index]
  end

  def record_guess(response)
    guesses << Guess.new(response, current_card)
    @index += 1
    guesses.last
  end

  def next_card
    if guesses.correct?
      @count += 1
    else !guesses.correct?
      deck.cards.push()
  end

  def number_correct
  end

end
