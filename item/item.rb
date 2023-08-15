require_relative "../observable"

class Item
  include Observable
  
  attr_accessor :damage, :name
  def initialize(name)
    @name = name
    @damage = nil
  end

  def to_s
    "#{@name}"
  end
end