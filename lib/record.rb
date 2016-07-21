module FileSystem
  class Record
    attr_reader :last_name, :first_name, :gender, :favorite_color, :date_of_birth
    def initialize(input)
      input_array = Parser.parse(input)
      @last_name = input_array[0]
      @first_name = input_array[1]
      @gender = input_array[2]
      @favorite_color = input_array[3]
      @date_of_birth = input_array[4]      
    end
  end
end