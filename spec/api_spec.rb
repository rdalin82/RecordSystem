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
    it "adds a new record" do 
      post '/', '{"text": "Thompson, Althea, Female, Gray, 09/28/1981"}', 'CONTENT_TYPE' => 'application/json'
      expect(last_response.status).to eq(201)
    end
  end
end
