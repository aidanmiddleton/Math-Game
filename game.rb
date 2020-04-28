
class Game

  attr_accessor :players, :current_player

  def initialize
    p player1 = Player.new("Player 1")
    p player2 = Player.new("Player 2")
    @players = [player1, player2]
    @current_player = @players[0]
  end

  def switch_player
    if(self.current_player == @players[0])
      self.current_player = @players[1]
    else
      self.current_player = @players[0]
    end
  end

  def round
    current_question = Question.new()
    puts "#{current_player.name}: #{current_question.text}"
    response = gets.chomp.to_i


    if(current_question.answer(response))
      puts "#{current_player.name}: YES! You are correct."
    else
      puts "#{current_player.name}: NO! You are not correct."
      current_player.lost_life
    end
    puts "P1: #{@players[0].lives}/3 vs P2: #{@players[1].lives}/3"
    if current_player.lives == 0
      gameover
    else
      switch_player
      round
    end
  end
  
  def start_game
      puts "                                          "
      puts "~~~~~Welcome to the Thunderdome!~~~~~~"
      puts "                                          "
      puts "Each player has 3 lives, and you lose a life\nwhen you answer a question incorrectly."
      puts "-------"
      puts "When either one of the players runs out of\nlives, they are vanquished, game over."
      puts "---------"
      puts "If you're ready to start, type 'y' in the prompt"
      confirm_start
  end 

  def confirm_start
    @players.each do |player|
      puts "\n#{player.name} ready?"
      print "> "
      answer = gets.chomp
      while (answer != "y")
        puts "Please type 'y' to start. You ready yet?"
        print "> "
        answer = gets.chomp
      end
    end
    puts "\n~~~~~~~~~~ 2 will enter, one will leave! ~~~~~~~~~~"  
    round
  end


  def gameover
    switch_player
    "----- GAME OVER -----"
    puts "#{current_player.name} has vanquished his opponent with a score of #{current_player.lives}"
    "What a lovely day!"
  end

end