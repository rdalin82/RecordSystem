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

    resources :records do 
      desc 'Add a Record'
      params do 
        requires :text, type: String
      end
      post do 
        RecordWriter.append(params[:text])
      end
      
      desc 'Return records by name descending'
      get :name do 
        RecordReader.load.sort(&:by_last_name).map(&:to_h) 
      end
      
      desc "Return records by gender and then by last name both in ascending order" 
      get :gender do 
        RecordReader.load.sort(&:by_gender).map(&:to_h)
      end
      
      desc "Return records by date of birth in ascending order" 
      get :birthdate do 
        RecordReader.load.sort(&:by_date).map(&:to_h)
      end
    end
    rescue_from ArgumentError, with: -> do
      Rack::Response.new('Properly formed response required, ie: LastName, FirstName, Gender, Color, DateofBirth #mm/dd/yyyy format', 400)
    end

    rescue_from NameError, with: -> do 
      Rack::Response.new("Date must be formated mm/dd/yyyy")
    end
  end
end