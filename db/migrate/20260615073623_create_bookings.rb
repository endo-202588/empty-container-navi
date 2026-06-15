class CreateBookings < ActiveRecord::Migration[8.1]
  def change
    create_table :bookings do |t|
      t.references :voyage, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :container_type, null: false
      t.integer :quantity, null: false
      t.string :cargo_name, null: false
      t.text :cargo_detail
      t.string :booking_number, null: false

      t.timestamps
    end

    add_index :bookings,
              :booking_number,
              unique: true
  end
end
