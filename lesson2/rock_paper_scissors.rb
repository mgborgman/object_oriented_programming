# the user makes a choice
# the computer makes a choice
# the winner is displayed

# Write a textual description of the problem or exercise.
# User is asked to choose rock, paper, or scissors
# computer chooses rock, paper, or scissors
# Users choice is compared with computers choice
# winner is displayed

# Extract the major nouns and verbs from the description.
# Player
# move
# rule

# choose
# compare

# Organize and associate the verbs with the nouns.
# Player 
# - choose
# move
# rule

# -compare

# The nouns are the classes and the verbs are the behaviors or methods.

class RPSGame
  attr_accessor :player, :computer

  def initialize
    @player = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors #{player.name}!"
  end

  def display_goodbye_message
    puts "Thanks for playing!"
  end

  def display_winner
    puts "#{player.name} chose #{player.move}"
    puts "#{computer.name} chose #{computer.move}"
    if player.move == 'rock' && computer.move == 'scissors' ||
       player.move == 'scissors' && computer.move == 'paper' ||
       player.move == 'paper' && computer.move == 'rock'

       puts "#{player.name} Won!"
    elsif computer.move == 'rock' && player.move == 'scissors' ||
          computer.move == 'scissors' && player.move == 'paper' ||
          computer.move == 'paper' && player.move == 'rock'
        puts "#{computer.name} Won!"
    else
        puts "Its a Tie."
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %(y n).include?(answer)
      puts "Invalid entry. Must be y or n."
    end
    return true if answer == 'y'
    return false
  end

  def play
    display_welcome_message
    loop do
      player.choose
      computer.choose
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

class Player
  attr_accessor :move, :name
  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "What is your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Must enter a value."
    end
    self.name = n
  end

  def choose
    puts "Choose: Rock, Paper, or scissors"
    choice = nil
    loop do
      choice = gets.chomp.downcase
      break if %w(rock paper scissors).include?(choice)
      puts "Invalid choice."
    end
    self.move = choice
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = %w(rock paper scissors).sample
  end
end

# class Move
#   attr_reader :move
#   def initialize(move)
#     @move = move
#   end

#   def to_s
#     self.move
#   end

# end

RPSGame.new.play

# find_winner = Rule.new
# player.player_choose
# computer.computer_choose
# find_winner.compare(player.move.to_s, computer.move.to_s)




