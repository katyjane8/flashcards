class Guess
  attr_reader :card, :response

  def initialize(response, card)
    @response = response
    @card = card
  end

  def correct?
    if @response == "Juneau"
      return true
    else
      return false
    end
  end

  def feedback
    if correct? == true
      feedback = "Correct!"
    else correct? == false
      feedback = "Incorrect."
    end
  end

end
