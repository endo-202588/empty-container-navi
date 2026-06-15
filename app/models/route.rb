class Route < ApplicationRecord
  has_many :voyages,
           dependent: :destroy

  belongs_to :departure_port,
             class_name: "Port"

  belongs_to :arrival_port,
             class_name: "Port"

  validate :route_must_be_unique

  validate :departure_and_arrival_must_differ

  private

  def departure_and_arrival_must_differ
    return unless departure_port_id.present?
    return unless arrival_port_id.present?
    return unless departure_port_id == arrival_port_id

    errors.add(
      :arrival_port_id,
      "は出発港と別にしてください"
    )
  end

  def route_must_be_unique
    return unless Route.where(
      departure_port_id: departure_port_id,
      arrival_port_id: arrival_port_id
    ).where.not(id: id).exists?

    errors.add(
      :base,
      "この航路はすでに登録されています"
    )
  end
end
