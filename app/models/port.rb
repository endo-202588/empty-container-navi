class Port < ApplicationRecord
  has_many :container_stocks, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
