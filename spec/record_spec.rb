require_relative './spec_helper'

RSpec.describe RecordSystem::Record do 
  #refactor to record instead of input
  let(:inputcomma) { "Dalin, Robert, Male, Blue, 12/05/1995" }
  let(:inputpipe) { "Dalin | Robert | Male | Blue | 12/05/1995" }
  let(:recordcomma) { RecordSystem::Record.new(inputcomma) }
  let(:recordpipe) { RecordSystem::Record.new(inputpipe) }
  context "with commas" do 
    it "creates a new record" do 
      record = RecordSystem::Record.new(inputcomma)
    end
    it "creates a new record and has a last name" do 
      expect(recordcomma.last_name).to eq("Dalin")
    end
    it "creates a new record and has a first name" do 
      expect(recordcomma.first_name).to eq("Robert")
    end
    it "creates a new record and has a gender" do 
      expect(recordcomma.gender).to eq("Male")
    end
    it "creates a new record and has a favorite color" do 
      expect(recordcomma.favorite_color).to eq("Blue")
    end
    it "creates a new record and has a birthday" do 
      expect(recordcomma.date_of_birth).to eq("12/05/1995")
    end
    it "can property write the record which is the same as input with a new line" do 
      expect(recordcomma.write).to eq(inputcomma+"\n")
    end
  end
  context "with pipes" do 
    it "creates a new record" do 
      record = RecordSystem::Record.new(inputpipe)
    end
    it "creates a new record and has a last name" do 
      expect(recordpipe.last_name).to eq("Dalin")
    end
    it "creates a new record and has a first name" do 
      expect(recordpipe.first_name).to eq("Robert")
    end
    it "creates a new record and has a gender" do 
      expect(recordpipe.gender).to eq("Male")
    end
    it "creates a new record and has a favorite color" do 
      expect(recordpipe.favorite_color).to eq("Blue")
    end
    it "creates a new record and has a birthday" do 
      expect(recordpipe.date_of_birth).to eq("12/05/1995")
    end
    it "can property write the record which is the same as input with a new line" do
      expect(recordpipe.write).to eq(inputcomma+"\n")
    end
  end
end