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

  validates :voyage,
          presence: true

  validates :user,
            presence: true

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

  validate :enough_container_stock
  validate :enough_voyage_capacity

  after_create :decrease_capacity
  after_destroy :restore_capacity

  private

  def generate_booking_number
    return if booking_number.present?

    self.booking_number =
      "BK-#{Date.current.strftime('%Y%m%d')}-#{SecureRandom.hex(3).upcase}"
  end

  def container_stock
    voyage.route.departure_port
          .container_stocks
          .find_by(
            carrier: voyage.carrier,
            container_type: container_type
          )
  end

  def enough_container_stock
    return if voyage.blank?
    stock = container_stock

    unless stock
      errors.add(
        :base,
        "該当するコンテナ在庫がありません"
      )
      return
    end

    if quantity > stock.quantity
      errors.add(
        :quantity,
        "がコンテナ在庫数を超えています"
      )
    end
  end

  def enough_voyage_capacity
    return if voyage.blank?

    if dry? && quantity > voyage.dry_capacity
      errors.add(
        :quantity,
        "がドライコンテナの空き枠を超えています"
      )
    end

    if reefer? && quantity > voyage.reefer_capacity
      errors.add(
        :quantity,
        "がリーファーコンテナの空き枠を超えています"
      )
    end
  end

  def decrease_capacity
    decrease_container_stock
    decrease_voyage_capacity
  end

  def restore_capacity
    restore_container_stock
    restore_voyage_capacity
  end

  def decrease_container_stock
    stock = container_stock

    return unless stock

    stock.decrement!(
      :quantity,
      quantity
    )
  end

  def decrease_voyage_capacity
    if dry?
      voyage.decrement!(
        :dry_capacity,
        quantity
      )
    else
      voyage.decrement!(
        :reefer_capacity,
        quantity
      )
    end
  end

  def restore_container_stock
    stock = container_stock

    return unless stock

    stock.increment!(
      :quantity,
      quantity
    )
  end

  def restore_voyage_capacity
    if dry?
      voyage.increment!(
        :dry_capacity,
        quantity
      )
    else
      voyage.increment!(
        :reefer_capacity,
        quantity
      )
    end
  end
end
