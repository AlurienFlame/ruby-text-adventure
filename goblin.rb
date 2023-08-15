require_relative "entity"

class Goblin < Entity
  def initialize
    super("Goblin")
    @health = 8
  end

  def take_turn
    puts "The #{self} takes a wild swing in your direction." # TODO: Procedurally generated text describing attacks
    player = @battle.get_participant_by_name("Player") # TODO: Target selection (find all enemy factions, attack highest hp enemy?)
    attack(player)
    @battle.end_turn(self)
  end
end