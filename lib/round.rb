require_relative 'deck'
require_relative 'guesses'

class Round
  attr_reader :deck, :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  def current_card
  
  end

end
