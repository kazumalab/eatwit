class AccountActivate < ApplicationRecord
  belongs_to :user

  validates :certificated_at, presence: true

  before_validation :ensure_certificated_at

  private

  def ensure_certificated_at
    self.certificated_at = Time.zone.now
  end
end

