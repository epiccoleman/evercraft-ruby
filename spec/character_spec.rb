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

  it "raises ArgumentError for invalid alignment" do
    expect{subject.alignment = "Good"}.not_to raise_error
    expect{subject.alignment = "Evil"}.not_to raise_error
    expect{subject.alignment = "Neutral"}.not_to raise_error
    expect{subject.alignment = "Nice"}.to raise_error(ArgumentError)
    expect{subject.alignment = "Literally Hitler"}.to raise_error(ArgumentError)
  end
   
  it "accepts lowercase versions of valid alignments" do 
   expect{subject.alignment = "good"}.not_to raise_error
   expect{subject.alignment = "evil"}.not_to raise_error
   expect{subject.alignment = "neutral"}.not_to raise_error
  end

  it "upcases alignment when given lowercase version" do
    subject.alignment = "evil" 
    expect(subject.alignment).to eq "Evil"
  end

  it "has a default armor class of 10" do
    expect(subject.armor_class).to eq 10
  end

  it "has 5 hp by default" do
    expect(subject.hp).to eq 5
  end

  it "loses 1 hit point when damaged by 1" do 
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

  it "accepts lowercase version of valid status" do
    expect{subject.status = "alive"}.to_not raise_error
    expect{subject.status = "dead"}.to_not raise_error
  end

  it "upcases status when given lowercase version" do
    subject.status = "alive"
    expect(subject.status).to eq "Alive"
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

  describe "attack" do 
    it "does 1 damage to enemy when roll beats enemy armor class" do
      enemy = Character.new
      success_roll = enemy.armor_class + 1
      damaged_hp = enemy.hp - 1 

      subject.attack(enemy, success_roll)
      
      expect(enemy.hp).to eq damaged_hp 
    end

    it "does no damage when roll doesn't beat enemy armor class" do 
      enemy = Character.new 
      bad_roll = enemy.armor_class - 1 
      hp_before_attack = enemy.hp

      subject.attack(enemy, bad_roll)

      expect(enemy.hp).to eq hp_before_attack
    end
  end

end

