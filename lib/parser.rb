module RecordSystem
  class Parser
    def self.parse(input) 
      input.split(pipe_and_comma_regex).map { |x| x.gsub(whitespace_and_newline_regex, "") }
    end
    def self.pipe_and_comma_regex
      /\,|\|/
    end
    def self.whitespace_and_newline_regex
      /\s|$/
    end
  end
end
