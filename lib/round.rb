require './lib/deck'
require './lib/guesses'
require './lib/card'
require 'pry'

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

  def record_guess(attempt)
    guesses << Guess.new(attempt, current_card)
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

  def start
    puts "Welcome! You're playing with #{deck.count} cards."
    deck.cards.each do |card|
    puts "This is card number #{current + 1} out of #{deck.count}."
    puts "Question: #{card.question}"
    response = gets.chomp.downcase
      record_guess(response)
      puts "#{guesses.last.feedback}"
      next_card
    end
    puts "****** Game over! ******"
    puts "You had #{number_correct} correct answers out of #{deck.count} for a score of #{percent_correct}%"
  end

end
