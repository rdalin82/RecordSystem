require './lib/parser'
require './lib/record'
require './lib/record_reader'
require './lib/record_writer'
require './lib/record_system'
require './lib/validator'

incoming_file = ARGV[0] ||= './data/records.csv'
destination_file = ARGV[1] ||= './data/records.csv'

input = File.open(incoming_file, 'r')
while !input.eof? 
  RecordSystem::RecordWriter.append(input.readline, :source=>destination_file)
end

puts "By Gender" 
puts RecordSystem::RecordReader.load(:source=>destination_file).sort(&:by_gender)
puts "" 

puts "By Last Name" 
puts RecordSystem::RecordReader.load(:source=>destination_file).sort(&:by_last_name)
puts "" 

puts "By Birthdate" 
puts RecordSystem::RecordReader.load(:source=>destination_file).sort(&:by_date)
puts "" 
