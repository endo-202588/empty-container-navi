class Booking < ApplicationRecord
  belongs_to :voyage
  belongs_to :user

  before_validation :generate_booking_number,
                  on: :create

  enum :container_type,
      {
        dry: 0,
        reefer: 1
      }

  validates :quantity,
            numericality: {
              greater_than: 0
            }

  validates :container_type,
          presence: true

  validates :cargo_name,
            presence: true

  validates :booking_number,
            presence: true,
            uniqueness: true

  private

  def generate_booking_number
    return if booking_number.present?

    self.booking_number =
      "BK-#{Date.current.strftime('%Y%m%d')}-#{SecureRandom.hex(3).upcase}"
  end
end
