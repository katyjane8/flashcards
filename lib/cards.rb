class Card
  attr_reader :question, :answer

  def initialize(question=nil, answer=nil)
    @question = question
    @answer = answer.downcase
  end
end
