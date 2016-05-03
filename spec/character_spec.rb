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

end


