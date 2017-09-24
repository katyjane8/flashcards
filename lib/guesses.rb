class Guess
  attr_reader :card, :response

  def initialize(response, card)
    @response = response
    @card = card
  end

  def correct?
    true
  end

  def feedback
    if correct? == true
      feedback = "Correct!"
    end 
  end

end
