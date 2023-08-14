require_relative "entity"

class Npc < Entity
  def take_turn
    puts "The #{self} stares at you."
    @battle.end_turn(self)
  end
end