require 'rails_helper'

RSpec.describe "Ports", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get ports_path

      expect(response).to have_http_status(:success)
    end
  end
end
