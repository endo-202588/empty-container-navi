require 'rails_helper'

RSpec.describe "Emails", type: :request do
  describe "GET /edit" do
    it "returns http success" do
      get "/emails/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/emails/update"
      expect(response).to have_http_status(:success)
    end
  end

end
