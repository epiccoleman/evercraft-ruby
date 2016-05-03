require 'character'

describe Character do 
  
  it "can set its name" do
    expected_name = "Nathan Explosion"
    subject.name = expected_name 
    expect(subject.name).to eq(expected_name)
  end

end


