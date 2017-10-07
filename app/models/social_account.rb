class SocialAccount < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :uid, presence: true, uniqueness: true

  has_many :user_social_accounts
  has_many :users, through: :user_social_accounts
end

