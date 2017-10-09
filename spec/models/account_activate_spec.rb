require "rails_helper"

RSpec.describe AccountActivate do
  describe "#valid" do
    let(:user) { create(:user, :with_password) }
    let(:account_activate) { AccountActivate.new(certificated_at: certificated_at, user_id: user.id) }

    context "success" do
      let(:certificated_at) { Time.zone.now }

      it { expect(account_activate).to be_valid }
    end
  end
end

