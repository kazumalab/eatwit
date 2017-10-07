require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  let(:user) { create(:user, :with_password) }
  let(:mailer_result) { UserMailer.account_activation(user, user.verifier_token) }

  it :aggregate_failures do
    expect(mailer_result.subject).to eq "Account Activation"
    expect(mailer_result.to).to eq [user.email]
  end
end

