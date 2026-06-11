class Voyage < ApplicationRecord
  belongs_to :route

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
