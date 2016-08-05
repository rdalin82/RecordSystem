module RecordSystem
  class Settings 
    attr_reader :parser, :validator, :source, :record 
    def initialize
      @parser = Parser
      @validator = Validator
      @source = File.expand_path("../data/records.csv", File.dirname(__FILE__))
      @record = Record
    end
  end
end
