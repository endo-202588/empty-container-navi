require 'rails_helper'

RSpec.describe "Guides", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/guides/show"
      expect(response).to have_http_status(:success)
    end
  end
end
