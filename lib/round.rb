require_relative 'deck'
require_relative 'guesses'

class Round
  attr_reader :deck, :guesses
  attr_accessor :index

  def initialize(deck)
    @deck = deck
    @guesses = []
    @index = 0
  end

  def current_card
    deck.cards[index]
  end

  def record_guess

  end

end
