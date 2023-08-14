require_relative "entity"

class Player < Entity
  def initialize
    super("Player")
    @health = 50
  end

  def attack(target_name=nil)
    # Identify target

    if target_name.nil?
      if @battle.participants.length == 2
        target = @battle.participants.find { |participant| participant != self }
      else
        puts "Please specify a target."
        return
      end
    else
      target = @battle.participants.find { |participant| participant.name == target_name }
    end

    if target.nil?
      puts "Failed to find target \"#{target_name}\"."
      return
    end

    # Attack target
    super(target)

    @battle.end_turn(self)
  end
end