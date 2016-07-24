module RecordSystem
  class RecordReader
    def self.file_source
      File.expand_path("../data/records.csv", File.dirname(__FILE__))
    end
    def self.load(**args)
      record_lines = [] 
      @@source = args[:source] ||= file_source
      @@record = args[:record] ||= Record
      file = File.open(@@source, 'r')
      while !file.eof? 
        record_lines << @@record.new(file.readline)
      end
      file.close
      record_lines
    end
  end
end