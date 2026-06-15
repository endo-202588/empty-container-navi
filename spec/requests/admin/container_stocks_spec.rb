require 'rails_helper'

RSpec.describe "Admin::ContainerStocks", type: :request do
  describe "GET /admin/ports" do
    it "未ログインならアクセスできない" do
      get admin_ports_path

      expect(response).to redirect_to(login_path)
    end
  end
end
