require 'rails_helper'

RSpec.describe "Guides", type: :request do
  describe "GET /show" do
    it "このアプリの使い方が表示される" do
      get guide_path
      expect(response).to have_http_status(:success)
      expect(response.body).to include("空コンナビの使い方")
    end
  end
end
