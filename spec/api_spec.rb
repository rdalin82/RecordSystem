require_relative './spec_helper'

RSpec.describe RecordSystem::API do 
  include Rack::Test::Methods

  def app
    RecordSystem::API
  end
  
  context "Get records" do 
    it "by gender" do
      get '/records/gender'
      expect(last_response.status).to eq(200)
    end
    it "by name" do
      get '/records/name'
      expect(last_response.status).to eq(200)
    end
    it "by birthdate" do
      get '/records/birthdate'
      expect(last_response.status).to eq(200)
    end
  end
  context "Post a new Record" do 
    after(:context) do
      file = File.open(File.expand_path("../data/records.csv", File.dirname(__FILE__)), 'w+')
      remainder = file.readlines.pop 
      if !remainder.nil? 
        remainder.each do |line|
          file.puts line 
        end
      end
      file.close
    end
    it "adds a new record" do 
      post '/', '{"text": "Thompson, Althea, Female, Gray, 09/28/1981"}', 'CONTENT_TYPE' => 'application/json'
      expect(last_response.status).to eq(201)
    end
  end
end
