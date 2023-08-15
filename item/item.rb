class Item
  attr_accessor :damage
  def initialize(name)
    @name = name
    @damage = nil
  end

  def to_s
    "#{@name}"
  end
end