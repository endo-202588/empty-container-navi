class User < ApplicationRecord
  authenticates_with_sorcery!

  before_validation :downcase_email

  enum :role, {
    admin: 0,
    carrier: 1,
    forwarder: 2
  }

  validates :password,
            confirmation: true,
            if: -> { new_record? || password.present? }

  validates :company_name, presence: true
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true

  private

  def downcase_email
    self.email = email.downcase if email.present?
  end
end
