class Scene
  attr_reader :actors

  def initialize()
    @actors = []
  end

  def add_entity(entity)
    @actors << entity
  end
end