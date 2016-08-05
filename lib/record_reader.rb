module RecordSystem
  class RecordReader
    def self.file_source
      File.expand_path("../data/records.csv", File.dirname(__FILE__))
    end
    def self.load()
      settings = Settings.new
      source = settings.source
      record = settings.record
      file = File.open(source, 'r')
      record_lines = [] 
      while !file.eof? 
        line = file.readline
        if !line.chomp.empty?
          record_lines << record.new(line)
        end
      end
      file.close
      record_lines
    end
  end
end