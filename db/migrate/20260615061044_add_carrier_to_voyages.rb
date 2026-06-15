class AddCarrierToVoyages < ActiveRecord::Migration[8.1]
  def change
    add_reference :voyages, :carrier, foreign_key: true
  end
end
