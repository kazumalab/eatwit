require "rails_helper"

RSpec.describe User do
  describe "#valid" do
    subject { user }
    let(:user) { User.new(user_attributes) }

    context "return true" do
      let(:user_attributes) { attributes_for(:user, :with_password) }

      it { is_expected.to be_valid }
    end

    context "return false when password null" do
      let(:user_attributes) { attributes_for(:user) }

      it { is_expected.to be_invalid }
    end

    context "return false when not unique name" do
      let(:user_attributes) { attributes_for(:user, :with_password, name: name) }
      let(:name) { "sample_person" }

      before { create(:user, :with_password, name: name) }

      it { is_expected.to be_invalid }
    end

    context "return false when not unique email" do
      let(:user_attributes) { attributes_for(:user, :with_password, email: email) }
      let(:email) { "sample@example.com" }

      before { create(:user, :with_password, email: email) }

      it { is_expected.to be_invalid }
    end
  end

  describe "#social_accounts" do
    let(:user) { create(:user, :with_password) }
    let(:social_account) { create(:social_account) }

    before do
      UserSocialAccount.create(user: user, social_account: social_account)
    end

    it { expect(user.social_accounts).to include social_account }
  end

  describe "#authenticated?" do
    subject { user.authenticated? }
    let(:user) { create(:user, :with_password) }

    context "return true" do
      before { user.build_account_activate }

      it { is_expected.to be_truthy }
    end

    context "return false" do
      it { is_expected.to be_falsey }
    end
  end

  describe "#activate" do
    let(:user) { create(:user, :with_password) }

    context "success" do
      it { expect { user.activate }.to change { AccountActivate.count }.by(1) }
    end
  end

  describe ".find_by_token" do
    let(:user) { create(:user, :with_password) }

    before do
      verifier = Rails.application.message_verifier(:registration_user)
      @token = verifier.generate([user.id, Time.zone.now])
    end

    context "success" do
      it { expect(User.find_by_token(@token)).to eq user }
    end

    context "invalid token" do
      let(:invalid_token) { @token + "hoge" }

      it { expect(User.find_by_token(invalid_token)).to be nil }
    end
  end
end

