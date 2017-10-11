require "rails_helper"

RSpec.describe SessionController do
  describe "#new" do
    before { get :new }

    it { expect(response).to have_http_status 200 }
  end

  describe "#create" do
    let(:user) { create(:user, :with_password) }

    before { post :create, params: { session: { name: user.name, password: "abcdef1234" } } }

    it :aggregate_failures do
      expect(response).to have_http_status 302
      expect(response).to redirect_to user
    end
  end
end

