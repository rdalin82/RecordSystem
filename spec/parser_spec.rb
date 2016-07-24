require_relative './spec_helper'

RSpec.describe RecordSystem::Parser do 
  let(:inputcomma) { "Raynor, Cayla, Male, White, 05/17/1988" }
  let(:inputpipe) { "Raynor | Cayla | Male | White | 05/17/1988" }
  let(:result) { ["Raynor", "Cayla", "Male", "White", "05/17/1988"] }

  it "should parse input with commas" do 
    expect(RecordSystem::Parser.parse(inputcomma)).to eq(result)
  end
  it "should parse input with pipes" do 
    expect(RecordSystem::Parser.parse(inputpipe)).to eq(result) 
  end
end