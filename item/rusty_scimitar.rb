require_relative "item"

class RustyScimitar < Item
  def initialize
    super("Rusty Scimitar")
    @damage = "1d6"
  end
end