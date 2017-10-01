require 'colorize'
require './lib/guesses'
require './lib/deck'
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

  def record_guess(response)
    guesses << Guess.new(response, current_card)
    guesses.last
  end

  def next_card
    if guesses.last.correct?
      @number_correct += 1
    else
      !guesses.last.correct?
      @number_correct
      deck.cards.push(deck.cards[@current])
    end
    @current +=1
  end

  def percent_correct
    (@number_correct.to_f / deck.cards.length * 100).to_i
  end

  # def pick_deck
  # puts "Welcome! Please choose a deck (hogwarts or turing):"
  # selection = gets.chomp
  #   if selection == "hogwarts"
  #     cards = CardGenerator.new('./hogwarts.txt')
  #   else selection == "turing"
  #     cards = CardGenerator.new('./cards.txt')
  #   end
  # end

  def start
    "You're playing with #{deck.count} cards."
    puts ("-"*60).cyan
    deck.cards.each do |card|
    puts "This is card number #{current + 1} out of #{deck.count}."
    puts "Question: #{current_card.question}"
    response = gets.chomp
      record_guess(response)
      puts "#{guesses.last.feedback}"
      next_card
    end
    puts "****** Game over! ******"
    puts "You had #{number_correct} correct answers out of #{deck.count} for a score of #{percent_correct}%"
  end
end
