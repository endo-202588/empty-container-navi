require "rails_helper"

RSpec.describe "Emails", type: :request do
  let(:user) { create(:user) }

  before do
    login_user(user)
  end

  describe "GET /edit" do
    it "returns http success" do
      get edit_email_path

      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH /update" do
    it "updates email" do
      patch email_path, params: {
        user: {
          email: "new@example.com"
        }
      }

      expect(response).to redirect_to(profile_path)
      expect(user.reload.email).to eq("new@example.com")
    end
  end
end