require_relative './spec_helper'

RSpec.describe FileSystem::Record do 
  let(:inputcomma) { "Dalin, Robert, Male, Blue, 12/05/1995" }
  let(:inputpipe) { "Dalin | Robert | Male | Blue | 12/05/1995" }
  it "creates a new record" do 
    record = FileSystem::Record.new(inputcomma)
  end
  it "creates a new record and has a last name" do 
    record = FileSystem::Record.new(inputcomma)
    expect(record.last_name).to eq("Dalin")
  end
  it "creates a new record and has a first name" do 
    record = FileSystem::Record.new(inputcomma)
    expect(record.first_name).to eq("Robert")
  end
  it "creates a new record and has a gender" do 
    record = FileSystem::Record.new(inputcomma)
    expect(record.gender).to eq("Male")
  end
  it "creates a new record and has a favorite color" do 
    record = FileSystem::Record.new(inputcomma)
    expect(record.favorite_color).to eq("Blue")
  end
  it "creates a new record and has a birthday" do 
    record = FileSystem::Record.new(inputcomma)
    expect(record.date_of_birth).to eq("12/05/1995")
  end
end