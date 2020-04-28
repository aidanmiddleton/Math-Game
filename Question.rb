class Question

  attr_accessor :num1, :num2, :player_response

  def initialize
    @num1 = rand(30) + 1
    @num2 = rand(30) + 1
    @sum = @num1 + @num2
  end

  def text
    "What is the sum of #{@num1} + #{@num2}?"
  end  

  def solution
    @sum
  end

  def answer(player_answer)
    player_answer == @sum
  end

end