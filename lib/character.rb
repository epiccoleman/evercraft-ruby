class Character
  def initialize
    @hp = 5
    @armor_class = 10
    @status = "Alive"

    @abilities = {}
    @abilities[:strength] = 10
    @abilities[:dexterity] = 10
    @abilities[:constitution] = 10
    @abilities[:wisdom] = 10
    @abilities[:intelligence] = 10
    @abilities[:charisma] = 10
  end

  attr_accessor :name
  attr_reader :armor_class

  attr_reader :alignment
  def alignment=(new_alignment) 
    valid_alignments = ['Good', 'Evil', 'Neutral']
    if not valid_alignments.include? new_alignment.capitalize
      raise ArgumentError
    end
    @alignment = new_alignment.capitalize
  end

  attr_reader :status
  def status=(new_status)
    valid_status = ['Alive', 'Dead']
    if not valid_status.include? new_status.capitalize
      raise ArgumentError 
    end
    @status = status.capitalize
  end

  attr_reader :hp
  def hp=(new_hp)
    @hp = new_hp
    if @hp <= 0
      @status = "Dead"
      @hp = 0
    end
  end

  def damage(damage)
    @hp -= damage
  end

  def attack(receiver, roll)
    if roll > receiver.armor_class
      receiver.damage 1
    end
  end

  def alive?
    @status == "Alive"
  end

  def strength
    @abilities[:strength]
  end
  
  def dexterity
    @abilities[:dexterity]
  end
  
  def constitution
    @abilities[:constitution]
  end

  def wisdom
    @abilities[:wisdom]
  end
  
  def intelligence
    @abilities[:intelligence]
  end

  def charisma
    @abilities[:charisma]
  end
end

