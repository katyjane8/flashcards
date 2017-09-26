require_relative 'deck'
require_relative 'guesses'
require_relative 'cards'

class Round
  attr_reader :deck, :guesses, :number_correct
  attr_accessor :current

  def initialize(deck)
    @deck = deck
    @guesses = []
    @current = 0
    @number_correct = 0
  end

  def current_card
    deck.cards[current]
  end

  def record_guess(response)
    guesses << Guess.new(response, current_card)
    @current += 1
    guesses.last
  end

  def number_correct
    if guesses.last.correct?
      @number_correct += 1
    else
      @number_correct
    end
  end

  def next_card
    if guesses.last.correct?
      @number_correct += 1
    else
      @number_correct
      deck.cards.push(deck.cards[@current])
    end
    @current +=1
  end

  def percent_correct
    (@number_correct.to_f / deck.cards.length * 100).to_i
  end

end


# require 'pry';binding.pry
