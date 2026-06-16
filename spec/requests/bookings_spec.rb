require "rails_helper"

RSpec.describe "Bookings", type: :request do
  describe "GET /new" do
    let(:voyage) { create(:voyage) }

    it "redirects to login page" do
      get new_voyage_booking_path(voyage)

      expect(response).to redirect_to(login_path)
    end
  end
end
