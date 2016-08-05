module RecordSystem
  class RecordWriter
    def self.file_source
      File.expand_path("../data/records.csv", File.dirname(__FILE__))
    end
    def self.append(input)
      settings = Settings.new
      source = settings.source
      record = settings.record
      File.open(source, 'a+') do |file|
        file.puts record.new(input).write 
      end
    end
  end
end