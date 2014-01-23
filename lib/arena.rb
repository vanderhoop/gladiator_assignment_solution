require 'gladiator'

class Arena

  def initialize(name)
    @name = name.capitalize
    @gladiators = []
  end

  def name
    @name
  end

  def gladiators
    @gladiators
  end

  def clear
    @gladiators = []
  end

  def remove_gladiator(gladiator_name)
    @gladiators.delete_if { |gladiator| gladiator.name == gladiator_name }
  end

  def entertained?
    @gladiators.find { |gladiator| gladiator.name == "Maximus" }
  end

  def add_gladiator(gladiator)
    @gladiators << gladiator if @gladiators.length < 2
  end

  def fight
    return "You need 2 gladiators in order for a fight to occur" if @gladiators.size < 2
    if @gladiators.find { |gladiator| gladiator.name == "Maximus" }
      return @gladiators.select { |gladiator| gladiator.name == "Maximus" }
    end
    key_beats_value = { "Trident" => "Spear", "Spear" => "Club", "Club" => "Trident" }
    glad1 = @gladiators[0]
    glad2 = @gladiators[1]
    if key_beats_value[glad1.weapon] == glad2.weapon
      @gladiators.delete_at(1)
      @gladiators
    elsif key_beats_value[glad2.weapon] == glad1.weapon
      @gladiators.delete_at(0)
      @gladiators
    elsif glad1.weapon == glad2.weapon
      @gladiators = []
    end

  end # def fight

end
