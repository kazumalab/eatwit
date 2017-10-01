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
end

