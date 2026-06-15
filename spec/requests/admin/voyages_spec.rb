require 'rails_helper'

RSpec.describe "Admin::Voyages", type: :request do
  describe "GET /admin/voyages" do
    it "未ログインならアクセスできない" do
      get admin_voyages_path

      expect(response).to redirect_to(login_path)
    end
  end
end
