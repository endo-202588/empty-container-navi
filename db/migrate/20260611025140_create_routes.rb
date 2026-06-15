class CreateRoutes < ActiveRecord::Migration[8.1]
  def change
    create_table :routes do |t|
      t.references :departure_port,
                   null: false,
                   foreign_key: { to_table: :ports }
      t.references :arrival_port,
                   null: false,
                   foreign_key: { to_table: :ports }

      t.timestamps
    end

    add_index :routes,
              [ :departure_port_id, :arrival_port_id ],
              unique: true
  end
end
