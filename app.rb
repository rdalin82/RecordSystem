require 'grape'
require 'json' 
require './lib/parser'
require './lib/record'
require './lib/record_reader'
require './lib/record_writer'
require './lib/record_system'
require './lib/validator'

module RecordSystem
  class API < Grape::API 
    content_type :json, 'application/json'
    default_format :json
    post '/' do 
       RecordWriter.append(params[:text])
    end
    get '/records/name' do 
       {:records_by_last_name => RecordReader.load.sort(&:by_last_name).map(&:to_h) }
    end
    get '/records/gender' do 
       {:records_by_gender=> RecordReader.load.sort(&:by_gender).map(&:to_h) }
    end
    get '/records/birthdate' do 
       {:records_by_birthdate=>RecordReader.load.sort(&:by_date).map(&:to_h) }
    end
  end
end