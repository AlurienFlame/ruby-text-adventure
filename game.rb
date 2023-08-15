require_relative "battle"
require_relative "entity"
require_relative "die"
require_relative "player"
require_relative "goblin"
require_relative "scene"

class Game
  def initialize
    scene = Scene.new
    @player = Player.new.place(scene)
    goblin = Goblin.new.place(scene)


    battle = Battle.new([@player, goblin])
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
    when "look", "inspect", "observe" # TODO: help command
      @player.look(input[1..-1].join(" "))
    when "attack"
      @player.attack(input[1])
    else
      puts "Invalid command"
    end
    prompt_input
  end
end
