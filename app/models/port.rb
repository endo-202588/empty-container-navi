class Port < ApplicationRecord
  has_many :container_stocks, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  validates :country, presence: true

  has_many :departure_routes,
           class_name: "Route",
           foreign_key: :departure_port_id,
           dependent: :destroy

  has_many :arrival_routes,
           class_name: "Route",
           foreign_key: :arrival_port_id,
           dependent: :destroy
end
