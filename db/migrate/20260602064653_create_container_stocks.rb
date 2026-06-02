class CreateContainerStocks < ActiveRecord::Migration[7.2]
  def change
    create_table :container_stocks do |t|
      t.references :port, null: false, foreign_key: true
      t.references :carrier, null: false, foreign_key: true
      t.integer :container_type, null: false
      t.integer :quantity, null: false, default: 0

      t.timestamps
    end
  end
end
