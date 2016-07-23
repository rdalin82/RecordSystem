module RecordSystem
  class RecordWriter
    def self.write(input, source="..data/records.csv", record=Record)
      @record = record
      File.open(source, 'a') do |file|
        file.puts @record.new(input)
      end
    end
  end
end