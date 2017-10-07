require "rails_helper"

RSpec.describe SocialAccount do
  describe "#valid" do
    subject { social_account }

    let(:social_account) { SocialAccount.new(account_attributes) }

    context "return true" do
      let(:account_attributes) { attributes_for(:social_account) }

      it { is_expected.to be_valid }
    end

    context "return false when not unique name" do
      let(:account_attributes) { attributes_for(:social_account, name: name) }
      let(:name) { "sample_person_nickname" }

      before { create(:social_account, name: name) }

      it { is_expected.to be_invalid }
    end
  end
end

