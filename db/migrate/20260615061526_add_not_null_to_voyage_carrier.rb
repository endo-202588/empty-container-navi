class AddNotNullToVoyageCarrier < ActiveRecord::Migration[8.1]
  def change
    change_column_null :voyages,
                       :carrier_id,
                       false
  end
end
