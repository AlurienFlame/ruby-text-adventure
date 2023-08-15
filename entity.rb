require_relative "die"

class Entity
  attr_accessor :battle, :name, :armor_class, :health

  def initialize(name)
    @name = name
    @health = 20
    @battle = nil
    @armor_class = 6
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
    puts "#{self} attacking #{target.name}..."

    # Roll to hit
    rolls = roll_dice("1d20")
    puts rolls >= target.armor_class ? "Hit!" : "Miss!"

    # Roll damage
    rolls = roll_dice("2d8")
    target.hurt(rolls)
  end
end
