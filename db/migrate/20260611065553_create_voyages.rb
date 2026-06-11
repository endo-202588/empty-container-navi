class CreateVoyages < ActiveRecord::Migration[8.1]
  def change
    create_table :voyages do |t|
      t.references :route, null: false, foreign_key: true
      t.date :departure_date, null: false
      t.integer :dry_capacity, null: false, default: 0
      t.integer :reefer_capacity, null: false, default: 0

      t.timestamps
    end

    add_index :voyages,
          [ :route_id, :departure_date ],
          unique: true
  end
end
