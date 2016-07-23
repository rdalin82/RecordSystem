module RecordSystem
  class RecordReader
    def self.open(source=file_source)
      File.open(source, 'r')
    end
    def self.load(source=file_source, record=Record)
      record_lines = [] 
      file = File.open(source, 'r')
      while !file.eof? 
        record_lines << Record.new(file.readline)
      end
      record_lines
    end
  end
end