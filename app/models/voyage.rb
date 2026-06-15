class Voyage < ApplicationRecord
  belongs_to :route
  belongs_to :carrier

  has_many :bookings,
           dependent: :destroy

  validate :voyage_must_be_unique

  validates :dry_capacity,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 0
            }

  validates :reefer_capacity,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 0
            }

  def reservable_from?(port, container_type)
    port.container_stocks
        .where(
          carrier_id: carrier_id,
          container_type: container_type
        )
        .where("quantity > 0")
        .exists?
  end

  private

  def voyage_must_be_unique
    return unless Voyage.where(
      departure_date: departure_date,
      route_id: route_id
    ).where.not(id: id).exists?

    errors.add(
      :base,
      "この便はすでに登録されています"
    )
  end
end
