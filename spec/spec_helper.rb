require 'rspec'
require 'rack/test'
require_relative '../lib/record'
require_relative '../lib/parser'
require_relative '../lib/record_reader'
require_relative '../lib/record_writer'
require_relative '../lib/record_system'
require_relative '../app'

RSpec.configure do |config|
  config.color = true
end