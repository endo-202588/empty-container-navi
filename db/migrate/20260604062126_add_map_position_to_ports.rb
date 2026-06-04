class AddMapPositionToPorts < ActiveRecord::Migration[7.2]
  def change
    add_column :ports, :map_x, :decimal
    add_column :ports, :map_y, :decimal
  end
end
