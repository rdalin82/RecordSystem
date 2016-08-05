module RecordSystem
  class RecordWriter
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