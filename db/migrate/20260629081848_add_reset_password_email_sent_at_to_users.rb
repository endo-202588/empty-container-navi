class AddResetPasswordEmailSentAtToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :reset_password_email_sent_at, :datetime
  end
end
