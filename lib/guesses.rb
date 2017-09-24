class Guess
  attr_reader :card, :response

  def initialize(response, card)
    @response = response
    @card = card
  end

  def correct?
    true
  end

end
