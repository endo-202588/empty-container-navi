require 'rails_helper'

RSpec.describe "Admin::Bookings", type: :request do
  describe "GET /admin/index" do
    it "未ログインならアクセスできない" do
      get admin_bookings_path

      expect(response).to redirect_to(login_path)
    end
  end
end
