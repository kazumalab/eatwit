require "rails_helper"

RSpec.describe ApplicationHelper do
  describe "#current_user" do
    context "login" do
      let(:user) { create(:user, :with_password) }

      before { login(user) }

      it { expect(helper.current_user).to eq user }
    end

    context "no login" do
      it { expect(helper.current_user).to be nil }
    end
  end

  describe "user_signed_in?" do
    context "login" do
      let(:user) { create(:user, :with_password) }

      before { login(user) }

      it { expect(helper.user_signed_in?).to be_truthy }
    end
  end
end

