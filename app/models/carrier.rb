class Carrier < ApplicationRecord
  has_many :container_stocks, dependent: :destroy

  has_many :voyages, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
