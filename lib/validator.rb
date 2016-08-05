class Validator
  def self.validate_length(input, length)
    if input.length != length 
      raise ArgumentError, "Must supply 'last_name, first_name, gender, favorite_color, date_of_birth' in your request"
    end
  end
end
