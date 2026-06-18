class BookingMailer < ApplicationMailer
  def completed(booking)
    @booking = booking

    mail(
      to: @booking.user.email,
      subject: "予約受付のお知らせ"
    )
  end
end
