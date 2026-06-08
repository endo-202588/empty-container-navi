class ContainerStock < ApplicationRecord
  belongs_to :port
  belongs_to :carrier

  enum :container_type, {
    dry: 0,
    reefer: 1
  }

  validates :quantity,
            numericality: { greater_than_or_equal_to: 0 }

  validates :carrier_id,
          uniqueness: {
            scope: %i[port_id container_type]
          }
end
