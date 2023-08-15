class Die
  attr_reader :result

  def initialize(sides)
    unless [4, 6, 8, 10, 12, 20].include?(sides.to_i)
      raise ArgumentError, "There is no such thing as a d#{sides}."
    end
    @sides = sides
  end

  def roll
    @result = rand(1..@sides.to_i)
  end

  def to_s
    # "[d#{@sides}] #{@result}"
    "#{@result}/#{@sides}"
  end
end

# TODO: Separate group rolling logic into "roll ndn" for calling manually, versus "roll_dice" for parsing from string

def roll_dice(string) # eg. "2d8+1d10"
  groups = string.split("+")
  dice = []
  groups.each do |group_str|
    num, sides = group_str.split("d")
    num.to_i.times do
      dice << Die.new(sides)
    end
  end
  dice.map(&:roll) # Roll each die
  sum = dice.map(&:result).inject(:+)
  puts "#{sum} (#{dice.join(", ")})"
  sum
end