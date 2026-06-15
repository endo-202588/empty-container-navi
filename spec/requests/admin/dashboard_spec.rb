require 'rails_helper'

RSpec.describe "Admin::Dashboards", type: :request do
  describe "GET /admin" do
    it "ログインしていない場合はログイン画面へリダイレクト" do
      get admin_root_path

      expect(response).to redirect_to(login_path)
    end
  end
end
