require_relative "entity"
require_relative "item/trusty_hatchet"

class Player < Entity
  def initialize
    super("Player")
    @health = @max_hp = 50
    @main_hand = TrustyHatchet.new
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

  def look(target_name)
    # Ensure target exists
    unless target_name
      puts "Look at what?"
      return
    end

    if target_name == ""
      target = @scene
    else
      target = @scene.actors.find { |entity| entity.name.downcase == target_name.downcase }
    end

    if target.nil?
      # Search equipment
      @scene.actors.each do |entity|
        if entity.main_hand.name.downcase == target_name.downcase
          target = entity.main_hand
          break
        end
      end
    end

    if target.nil?
      puts "You don't see a \"#{target_name}\" around."
      return
    end

    puts target.info
    return
  end
end