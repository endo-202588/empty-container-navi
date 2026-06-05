class AddLowerEmailIndexToUsers < ActiveRecord::Migration[7.2]
  def change
    add_index :users,
              "lower(email)",
              unique: true,
              name: "index_users_on_lower_email"
  end
end
