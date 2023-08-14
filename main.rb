require_relative "game"

def main
  trap("SIGINT") do
    puts "Goodbye!"
    exit 130
  end
  game = Game.new
  game.prompt_input
end

main
