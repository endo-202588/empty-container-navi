require "rails_helper"

RSpec.describe BookingMailer, type: :mailer do
  describe "#completed" do
    let(:booking) { create(:booking) }

    subject(:mail) { described_class.completed(booking) }

    it "メールが生成されること" do
      expect(mail.subject).to eq("予約受付のお知らせ")
      expect(mail.to).to eq([ booking.user.email ])
      expect(mail.from).to eq([ "from@example.com" ])
    end
  end
end
