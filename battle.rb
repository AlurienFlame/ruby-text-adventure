class Battle
  attr_accessor :participants

  def initialize(participants)
    @participants = participants # TODO: Data structur-ize initiative. Circularly linked list?
    participants.each do |participant|
      participant.battle = self
    end
    puts "#{participants.join(", ")} enter the fray!"
  end

  def to_s
    "Battle between #{@participants}"
  end

  def end_turn(most_recent_participant_to_act)

    next_participant_to_act = @participants[(@participants.index(most_recent_participant_to_act) + 1) % @participants.length]

    # If the next participant to act is the player, then pass control to them.
    if next_participant_to_act.name == "Player"
      puts "Your turn."
      return
    end

    # Otherwise, let the AI handle it
    puts "#{next_participant_to_act} takes their turn."
    next_participant_to_act.take_turn

  end

  def remove_from_initiative(participant)
    @participants.delete(participant)
    puts "#{participant} is out of the fight."
    if @participants.length == 1 # TODO: Later, check if there's only one *faction* remaining, instead
      puts "#{@participants[0]} is victorious!"
      exit 0
    end
  end

  def get_participant_by_name(name)
    @participants.find { |participant| participant.name == name }
  end

end
