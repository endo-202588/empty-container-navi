class AddCountryToPorts < ActiveRecord::Migration[8.1]
  def change
    add_column :ports,
           :country,
           :string,
           null: false,
           default: "JP"
  end
end
