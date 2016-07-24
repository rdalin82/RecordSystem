module RecordSystem
  class RecordWriter
    def self.file_source
      File.expand_path("../data/records.csv", File.dirname(__FILE__))
    end
    def self.append(input, **args)
      @@source = args[:source] ||= file_source
      @@record = args[:record] ||= Record
      File.open(@@source, 'a') do |file|
        file.puts @@record.new(input).write 
        file.close
      end
    end
  end
end