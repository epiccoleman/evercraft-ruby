class Character
  def initialize
    @hp = 5
    @armor_class = 10
  end

  attr_accessor :name
  attr_reader :armor_class
  attr_reader :hp

  attr_reader :alignment
  def alignment=(alignment) 
    valid_alignments = ['Good', 'Evil', 'Neutral']
    if not valid_alignments.include? alignment.capitalize
      raise ArgumentError
    end
    @alignment = alignment.capitalize
  end

  def damage(damage)
    @hp -= damage
  end

end

