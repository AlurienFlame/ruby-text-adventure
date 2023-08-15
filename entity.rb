require_relative "die"

class Entity
  attr_accessor :battle, :name, :armor_class, :health

  def initialize(name)
    @scene = nil
    @name = name
    @health = 20
    @battle = nil
    @armor_class = 6
    @main_hand = nil
  end

  def to_s
    @name
  end

  def hurt(value)
    @health -= value
    if @health <= 0
      puts "#{self} was killed!"
      @battle.remove_from_initiative(self)
      return
    end
    puts "#{self} was hit for #{value} damage. (#{@health} health left)"
  end

  def attack(target)
    puts "#{self} attacking #{target.name} with #{@main_hand}..."

    # Roll to hit
    crit = false
    to_hit = roll_dice("1d20")
    if to_hit == 20
      puts "Critial hit!"
      crit = true
    elseif to_hit >= target.armor_class
      puts "Hit!"
    else
      puts "Miss!"
      return
    end

    # Roll damage
    damage = roll_dice(@main_hand.damage)
    if crit
      damage *= 2
    end
    target.hurt(damage)
  end

  def place(scene)
    @scene = scene
    scene.add_entity(self)
    return self
  end
end
