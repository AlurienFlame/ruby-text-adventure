require_relative "item"

class RustyScimitar < Item
  def initialize
    super("Rusty Scimitar")
    @damage = "1d6"
    @appearance = "Its blade is dull and chipped."
  end
end