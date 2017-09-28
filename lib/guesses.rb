class Guess
  attr_reader :card, :response, :feedback

  def initialize(response, card)
    @response = response.downcase
    @card = card
  end

  def correct?
    @response == card.answer
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end

end
