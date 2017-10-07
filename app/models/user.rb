class User < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  has_secure_password

  has_many :user_social_accounts, dependent: :destroy
  has_many :social_accounts, through: :user_social_accounts, dependent: :destroy
  has_one  :account_activate

  def authenticated?
    return false unless account_activate
    true
  end

  def activate
    create_account_activate
  end

  def self.find_by_token(token)
    return nil unless token
    verifier = Rails.application.message_verifier(:registration_user)
    return nil unless verifier.valid_message?(token)
    id, registrated_at = verifier.verify(token)
    return nil if registrated_at < 1.day.ago
    User.find_by(id: id)
  end

  def verifier_token
    verifier = Rails.application.message_verifier(:registration_user)
    verifier.generate([id, Time.zone.now])
  end
end

