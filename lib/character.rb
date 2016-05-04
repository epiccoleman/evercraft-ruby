class Character
  attr_accessor :name
  attr_reader :alignment

  def alignment=(alignment) 
    valid_alignments = ['Good', 'Evil', 'Neutral']
    if not valid_alignments.include? alignment.capitalize
      raise ArgumentError
    end
    @alignment = alignment.capitalize
  end

end

