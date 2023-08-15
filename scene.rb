class Scene
  include Observable

  attr_reader :actors

  def initialize()
    @actors = []
    @name = "The Void"
    @description = "A stark white plane stretches out in all directions. It is marked by a grid of black lines, each one a meter apart. The sun reflects unpleasantly off the white surface."
  end

  def add_entity(entity)
    @actors << entity
  end
end