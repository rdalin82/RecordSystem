module RecordSystem
  class RecordWriter
    def self.file_source
      File.expand_path("../data/records.csv", File.dirname(__FILE__))
    end
    def self.append(input, **args)
      source = args[:source] ||= file_source
      record = args[:record] ||= Record
      parser = args[:parser] ||= Parser
      File.open(source, 'a+') do |file|
        file.puts record.new(input, :parser=>parser).write 
      end
    end
  end
end