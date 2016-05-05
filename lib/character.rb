class Character
  def initialize
    @hp = 5
    @armor_class = 10
    @status = "Alive"
  end

  attr_accessor :name
  attr_reader :armor_class
  attr_reader :status

  attr_reader :alignment
  def alignment=(alignment) 
    valid_alignments = ['Good', 'Evil', 'Neutral']
    if not valid_alignments.include? alignment.capitalize
      raise ArgumentError
    end
    @alignment = alignment.capitalize
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

end

