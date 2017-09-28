require './lib/deck'
require './lib/guesses'
require './lib/cards'

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

  def start
    puts "Welcome! You're playing with 4 cards."
    puts "This is card number 1 out of 4."
    puts "Question: What is 5 + 5?"
    response = gets.chomp.downcase
      if response == 10
        puts "Correct!"
      else
        puts "Try again!"
      end
    puts "This is card number 2 out of 4."
    puts "Question: What is Rachel's favorite animal?"
    response = gets.chomp.downcase
      if response == "red panda"
        puts "Correct!"
      else
        puts "Incorrect."
      end
    puts "This is card number 3 out of 4."
    puts "Question: What is Mike's middle name?"
    response = gets.chomp.downcase
      if response == "nobody knows"
        puts "Correct!"
      else
        puts "Incorrect."
      end
    puts "****** Game over! ******"
    puts "You had 3 correct guesses out of 4 for a score of 75%."
  end

end
