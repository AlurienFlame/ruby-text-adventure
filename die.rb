class Die
  def initialize(sides)
    unless [4, 6, 8, 10, 12, 20].include?(sides.to_i)
      raise ArgumentError, "There is no such thing as a d#{sides}."
    end
    @sides = sides
  end

  def roll
    rand(1..@sides.to_i)
  end
end


def roll_ndn_dice(num, sides)
  rolls = []
  num.to_i.times do
    die = Die.new(sides.to_i)
    rolls << die.roll
  end
  rolls.select { |element| element.is_a? Integer }
  return rolls
end

def roll_dice(string) # eg. "2d8+1d10"
  groups = string.split("+")
  rolls = []
  groups.each do |group|
    num, sides = group.split("d")
    rolls += roll_ndn_dice(num, sides)
  end
  puts "Rolled #{rolls.join(", ")} for a total of #{rolls.reduce(:+)}."
  rolls
end