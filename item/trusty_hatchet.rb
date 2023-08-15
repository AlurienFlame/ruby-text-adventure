require_relative "item"

class TrustyHatchet < Item
  def initialize
    super("Trusty Hatchet")
    @damage = "1d8"
  end
end