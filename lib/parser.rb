class Parser
  def self.parse(input)
    #1st regex for "|" and "," char and 2nd regex whitespace and newline char
    input.split(/\,|\|/).map { |x| x.gsub(/\s|$/, "") }
  end
end