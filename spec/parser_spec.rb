require_relative './spec_helper'

RSpec.describe RecordSystem::Parser do 
  let(:inputcomma) { "Dalin, Robert, Male, Blue, 12/05/1995" }
  let(:inputpipe) { "Dalin | Robert | Male | Blue | 12/05/1995" }
  let(:result) { ["Dalin", "Robert", "Male", "Blue", "12/05/1995"] }

  it "should parse input with commas" do 
    expect(RecordSystem::Parser.parse(inputcomma)).to eq(result)
  end
  it "should parse input with pipes" do 
    expect(RecordSystem::Parser.parse(inputpipe)).to eq(result) 
  end
end