require 'rails_helper'

RSpec.describe NasaApiController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
	  
	it "returns information from API" do
      get :index
      json = JSON.parse(response.body)
      expect(response.body).not_to be_nil
    end
  end
end
