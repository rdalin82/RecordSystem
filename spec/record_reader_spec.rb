require_relative './spec_helper'
RSpec.describe RecordSystem::RecordReader do 
  context "loading files" do 
    it "Should read files from '../data/records.csv' " do 
      allow(RecordSystem::RecordReader).to receive(:load).and_return(["Dalin, Robert, Male, Blue, 12/05/1995"])
      expect(RecordSystem::RecordReader.load).to eq(["Dalin, Robert, Male, Blue, 12/05/1995"])
    end
  end
  context "opening file" do 
    it "should return a file object from ../data/records.csv" do 
      allow(RecordSystem::RecordReader).to receive(:open).and_return(File.open(File.expand_path("../data/records.csv", File.dirname(__FILE__)), 'r'))
      expect(RecordSystem::RecordReader.open.class).to eq(File.open(File.expand_path("../data/records.csv", File.dirname(__FILE__)), 'r').class)
    end
  end
end