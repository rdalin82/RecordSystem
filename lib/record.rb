require 'date'
module RecordSystem
  class Record
    attr_reader :last_name, :first_name, :gender, :favorite_color
    def initialize(input, parser=Parser)
      input_array = parser.parse(input)
      @last_name = input_array[0]
      @first_name = input_array[1]
      @gender = input_array[2]
      @favorite_color = input_array[3]
      @date_of_birth = dob(input_array[4])      
    end
    def write 
      "#{@last_name}, #{@first_name}, #{@gender}, #{@favorite_color}, #{date_of_birth}\n"
    end
    def dob(dob_input)
      dob = dob_input.split("/").map { |x| x.to_i } #[month, day, year]
      Date.new(dob[2], dob[0], dob[1]) 
    end
    def date_of_birth
      "#{@date_of_birth.strftime('%m/%d/%Y')}"
    end
  end
end