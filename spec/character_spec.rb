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
   expect(subject.alignment).to eq("Good") 
  end

  it "has a default armor class of 10" do
    expect(subject.armor_class).to eq 10
  end

end


