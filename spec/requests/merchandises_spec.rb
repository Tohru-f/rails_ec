require 'rails_helper'

RSpec.describe "Merchandises", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/merchandises/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/merchandises/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/merchandises/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /etit" do
    it "returns http success" do
      get "/merchandises/etit"
      expect(response).to have_http_status(:success)
    end
  end

end
