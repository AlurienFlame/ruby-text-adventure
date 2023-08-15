require_relative "item"

class TrustyHatchet < Item
  def initialize
    super("Trusty Hatchet")
    @damage = "1d8"
    @appearance = "Designed for chopping wood, now turned to a far grimmer purpose."
  end
end