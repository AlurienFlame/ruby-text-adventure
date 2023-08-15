module Observable
  def to_s
    @name
  end

  def info
    # appearance
    description = "#{@name}."

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

    # child info
    if @main_hand
      description += indent("\n└#{@main_hand.info}")
    end

    if @actors
      actor_info = @actors.map { |actor| actor.info }
      description += indent("\n└#{actor_info.join("\n└")}")
    end

    return description
  end

  def indent(str)
    str.gsub(/^/, '  ')
  end
end