class CardGenerator
  attr_reader :cards

  def initialize(filename)
    @cards = []
    runner(filename)
  end

  def runner(filename)
    File.foreach filename do |line|
      card = line.chomp.split(",")
      cards << Card.new(card[0], card[1])
    end
  end
end
