require_relative "entity"
require_relative "item/trusty_hatchet"

class Player < Entity
  def initialize
    super("Player")
    @health = 50
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

    target = @scene.actors.find { |entity| entity.name.downcase == target_name.downcase }

    # Find info about target to print
    if target.respond_to?(:info)
      puts target.info
    elsif target.respond_to?(:to_s)
      puts target.to_s
    elsif target.respond_to?(:inspect)
      puts target.inspect
    end
  end
end