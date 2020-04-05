require 'rails_helper'


RSpec.describe "NASA APOD", type: :request do
  describe "GET /nasa_api" do
    it "should return title" do
      @nasa_info.should_receive("title")
    end
    it "should give body of text" do 
      @nasa_info.should_receive("explaination")
    end
    it "should give date" do
      @nasa_info.should_receive("date")
    end
    it "returns information from API" do
      get('/nasa_api')
      json = JSON.parse(response.body)
      expect(response.body).not_to be_nil
    end
  end
end

