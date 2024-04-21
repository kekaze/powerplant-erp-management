require 'rails_helper'

RSpec.describe "WorkOders", type: :request do
  describe "GET /login" do
    it "returns http success" do
      get "/work_oders/login"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /attempt_login" do
    it "returns http success" do
      get "/work_oders/attempt_login"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/work_oders/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/work_oders/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/work_oders/destroy"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/work_oders/update"
      expect(response).to have_http_status(:success)
    end
  end

end
