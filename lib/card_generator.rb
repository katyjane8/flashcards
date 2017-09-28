class CardGenerator

  def initialize(filename)
    @filename = filename
  end

  def runner
    File.open(@filename).readlines.map do |line|
      question, answer = line.chomp.split(",")
      Card.new(question, answer)
    end
  end
end
