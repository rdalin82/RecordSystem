module RecordSystem
  class Parser
    def self.parse(input) 
      parsed = input.split(pipe_and_comma_regex).map { |x| x.gsub(whitespace_and_newline_regex, "") }
      input_validation(parsed)
      dob_validation(parsed[4])
      return parsed
    end
    def self.pipe_and_comma_regex
      /\,|\|/
    end
    def self.whitespace_and_newline_regex
      /\s|$/
    end
    def self.dob_validation(dob_input)
      array_length = 3 
      if dob_input.split("/").length != array_length 
        raise ArgumentError, "Must supply date in mm/dd/yyyy format"
      end
    end
    def self.input_validation(input_array)
      array_length = 5
      if input_array.length != array_length 
        raise ArgumentError, "Must supply 'last_name, first_name, gender, favorite_color, date_of_birth' in your request"
      end
    end
  end
end
