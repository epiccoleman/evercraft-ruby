require 'character'

describe Character do 
  
  it "can set its name" do
    expected_name = "Nathan Explosion"
    subject.name = expected_name 
    expect(subject.name).to eq(expected_name)
  end

  it "can set its alignment" do
    expected_alignment = "Good"
    subject.alignment = expected_alignment 
    expect(subject.alignment).to eq(expected_alignment)
  end

  it "raises ArgumentError when given an invalid alignment" do
    expect{subject.alignment = "Decent"}.to raise_error(ArgumentError)
  end
   
  it "accepts lowercase versions of valid alignments" do 
   subject.alignment = "good"
   expect(subject.alignment).to eq "Good" 
  end

  it "has a default armor class of 10" do
    expect(subject.armor_class).to eq 10
  end

  it "has 5 hp by default" do
    expect(subject.hp).to eq 5
  end

#  it "can be damaged" do 
#    subject.damage 1
#    expect(subject.hp).to eq 4 
#  end 

  it "can be damaged" do 
    expected_hp = subject.hp - 1 
    subject.damage 1
    expect(subject.hp).to eq expected_hp 
  end 

  it "has a status of 'Alive' by default" do
    expect(subject.status).to eq "Alive"
  end

  it "raises ArgumentException for invalid status" do
    expect{subject.status = "Alive"}.to_not raise_error
    expect{subject.status = "Dead"}.to_not raise_error
    expect{subject.status = "Spaced Out"}.to raise_error(ArgumentError)
  end

  describe "when its HP hits zero" do 
    before(:each) do
      subject.hp = 0
    end

    it "has a status of 'Dead'" do 
      expect(subject.status).to eq 'Dead'
    end

    it "is not alive" do 
      expect(subject.alive?).to be false
    end
  end


end

