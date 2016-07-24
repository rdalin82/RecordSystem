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
      expect(recordcomma.date_of_birth).to eq(Date.new(1995, 12, 5))
    end
    it "should property write the record which is the same as input with a new line" do 
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
      expect(recordpipe.date_of_birth).to eq(Date.new(1995, 12, 5))
    end
    it "should property write the record which is the same as input with a new line" do
      expect(recordpipe.write).to eq(inputcomma+"\n")
    end
  end
  context "sorting records" do 
    let(:record1) { RecordSystem::Record.new("Raynor, Cayla, Male, White, 05/17/1988") }
    let(:record2) { RecordSystem::Record.new("Thompson, Althea, Female, Gray, 09/28/1981") }
    let(:record3) { RecordSystem::Record.new("Wolf, Diego, Male, White, 01/29/1988") }
    let(:record4) { RecordSystem::Record.new("Hintz, Vinnie, Female, Gray, 08/11/1982") }
    let(:record5) { RecordSystem::Record.new("Dare, Rose, Female, Red, 05/28/1986") }
    let(:record6) { RecordSystem::Record.new("Orn, Cindy, Female, White, 06/04/1985") }
    let(:record7) { RecordSystem::Record.new("Waelchi, Alan, Male, Gray, 07/03/1989") }
    let(:record8) { RecordSystem::Record.new("Swift, Elmira, Female, Green, 09/01/1988") }
    let(:record9) { RecordSystem::Record.new("Ryan, Harrison, Male, Green, 11/24/1985") }
    let(:record10) { RecordSystem::Record.new("Reynolds, Floyd, Female, Red, 04/24/1983") }
    let(:allrecords) { [record1, record2, record3, record4, record5, record6, record7, record8, record9, record10].shuffle }
    let(:sorted_by_last_name) { [record3, record7, record2, record8, record9, record10, record1, record6, record4, record5]}
    let(:sorted_by_gender) { [record5, record4, record6, record10, record8, record2, record1, record9, record7, record3]}
    it "#by_date comparator" do 
      records = [record1, record2, record8]
      expect(record1.by_date(record2)).to eq(1)
      expect(record1.by_date(record8)).to eq(-1)
      expect(record1.by_date(record1)).to eq(0)
      expect(records.sort(&:by_date)).to eq([record2, record1, record8])
    end 
    it "#by_last_name comparator descending order" do 
      expect(record3.by_last_name(record10)).to eq(-1)
      expect(record3.by_last_name(record3)).to eq(0)
      expect(record10.by_last_name(record3)).to eq(1)
      expect(allrecords.sort(&:by_last_name)).to eq(sorted_by_last_name)
    end 
    it "#by_gender comparator" do 
      expect(record1.by_gender(record10)).to eq(1)
      expect(record10.by_gender(record1)).to eq(-1)
      expect(record10.by_gender(record10)).to eq(0)
      expect(allrecords.sort(&:by_gender)).to eq(sorted_by_gender)
    end      
  end
end