# EXTRA CREDIT:
#
# Create a program that will play the Greed Game.
# Rules for the game are in GREED_RULES.TXT.
#
# You already have a DiceSet class and score function you can use.
# Write a player class and a Game class to complete the project.  This
# is a free form assignment, so approach it however you desire.

class GreedGame
  # initialize all game information
  def initialize
    @first_score = 0
    @second_score = 0
  end

  # dice roll
  def roll(num)
    @dice = num.times.map { Random.new.rand(1..num).to_i }
  end

  # score roll
  def score(dice)
    score = 0
    count = []

    (1..6).to_a.each { |i| count[i] = 0 }

    dice.each { |d| count[d] += 1 }

    if count[1] >= 3
      score += 1000
      count[1] -= 3
    end

    score += count[1] * 100

    if count[5] >= 3
      score += 500
      count[5] -= 3
    end

    score += count[5] * 50

    count.each_with_index do |n, i|
      score += i * 100 if (n != nil && n >= 3)
    end

    score
  end

  # find out if total score >3000 for either player
  def game_ending?
    @first_score > 3000 || @second_score > 3000
  end

  def display_main_menu
    puts "1) Start a new game"
    puts "2) Help"
    puts "3) Quit"
  end

  def display_play_menu
    puts "1) Roll"
    puts "2) Stop your turn"
    puts "3) View roll score"
    puts "4) View total score (including current roll total)"
  end
  
  def play_game
    display_play_menu
    case gets.to_i
      when 1
        puts "Rolling dice"
      when 2
        puts "Stopping turn"
      when 3..4
        puts "TODO"
    end
  end
end

class Main
  @game = GreedGame.new
  
  puts "*" * 80
  intro = "Welcome to Greed"
  spacing = " " * ((80 - intro.length) / 2)
  puts spacing + intro + spacing
  puts "*" * 80

  puts "\n"
  @game.display_main_menu

  case gets.to_i
    when 1
      puts "Starting new game\n\n"
      puts "Player 1 to roll first"
      @game.play_game
    when 2
      puts"Insert Help here"
    when 3
      exit
  end
end

