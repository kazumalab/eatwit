require "rails_helper"

RSpec.describe RegistrationController do
  describe "#create" do
    let(:user) { create(:user, :with_password) }
    let(:token) { user.verifier_token }

    before do
      get :create, params: { token: token }
    end

    it :aggregate_failures do
      expect(response).to have_http_status 302
      expect(response).to redirect_to user
    end
  end
end

