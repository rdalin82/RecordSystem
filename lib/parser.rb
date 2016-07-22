module RecordSystem
  class Parser
    def self.parse(input)
      #1st regex for "|" and "," and 2nd regex whitespace and newline 
      input.split(/\,|\|/).map { |x| x.gsub(/\s|$/, "") }
    end
  end
end
