require './lib/cards'
require './lib/guesses'
require './lib/deck'
require './lib/round'
require './lib/messages'
require './lib/card_generator'

cards = CardGenerator.new("./cards.txt").cards
deck = Deck.new(cards)
round = Round.new(deck)
round.start
