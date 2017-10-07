class User < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  has_secure_password

  has_many :user_social_accounts, dependent: :destroy
  has_many :social_accounts, through: :user_social_accounts, dependent: :destroy

  def authenticated?
    false
  end
end

