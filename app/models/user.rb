class User < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  has_secure_password
end

