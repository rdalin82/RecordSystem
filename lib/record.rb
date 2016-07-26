require 'date'
module RecordSystem
  class Record
    attr_reader :last_name, :first_name, :gender, :favorite_color, :date_of_birth
    def initialize(input, **args)
      @parser = args[:parser] ||= Parser
      @validator = args[:validator] ||= Validator.new
      input_array = @parser.parse(input)
      @validator.validate_length(input_array, 5)
      input_assignment(input_array)
    end
    def input_assignment(input_array)
      @last_name = input_array[0]
      @first_name = input_array[1]
      @gender = input_array[2]
      @favorite_color = input_array[3]
      @date_of_birth = dob(input_array[4]) 
    end
    def to_h
      { "#{@first_name[0]+@last_name}": 
        {
          last_name: @last_name,
          first_name: @first_name,
          gender: @gender,
          color: @favorite_color,
          birthdate: display_dob 
        }
      }
    end
    def write
      "#{@last_name}, #{@first_name}, #{@gender}, #{@favorite_color}, #{display_dob}"
    end
    def dob(dob_input)
      dob = dob_input.split("/").map { |x| x.to_i } #[month, day, year]
      Date.new(dob[2], dob[0], dob[1]) 
    end
    def display_dob
      "#{@date_of_birth.strftime('%m/%d/%Y')}"
    end
    def by_date(other) 
      self.date_of_birth <=> other.date_of_birth
    end
    def by_last_name(other) 
      other.last_name <=> self.last_name #this order reverses
    end
    def by_gender(other)
      if self.gender.downcase == other.gender.downcase
        self.last_name <=> other.last_name
      else
        self.gender <=> other.gender
      end
    end
  end
end