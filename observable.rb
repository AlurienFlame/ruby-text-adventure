module Observable
  def to_s
    @name
  end

  def info
    # appearance
    description = "A #{@name}."

    if @appearance
      description += " #{@appearance}"
    end

    # equipment
    if @main_hand
      description += " It wields a #{@main_hand}."
    end

    # stats
    if @health && @max_hp
      healthiness = "Healthy"
      if @health < @max_hp / 4
        healthiness = "Near death"
      elsif @health < @max_hp / 2
        healthiness = "Injured"
      elsif @health < @max_hp
        healthiness = "Hurt"
      end
    end

    return description
  end
end