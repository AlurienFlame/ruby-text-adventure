require_relative "battle"
require_relative "entity"
require_relative "die"
require_relative "player"
require_relative "goblin"

class Game
  def initialize
    @player = Player.new
    battle = Battle.new([@player, Goblin.new])
  end

  def prompt_input()
    print ">"
    input = gets.chomp.split(" ")

    case input[0]
    when "exit"
      puts "Goodbye!"
      exit 0
    when "roll"
      rolls = roll_dice(input[1])
    when "attack"
      @player.attack(input[1])
    else
      puts "Invalid command"
    end
    prompt_input
  end
end
