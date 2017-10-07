class UserSocialAccount < ApplicationRecord
  belongs_to :user
  belongs_to :social_account
end

