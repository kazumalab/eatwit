require "rails_helper"

RSpec.describe UsersController do
  describe "#new" do
    before { get :new }

    it { expect(response).to have_http_status 200 }
  end

  describe "#create" do
    let(:user_attributes) { attributes_for(:user, :with_password) }
    let(:result_user) { assigns(:user) }

    before do
      post :create, params: { user: user_attributes }
    end

    it :aggregate_failures do
      expect(result_user.email).to eq user_attributes[:email]
      expect(response).to have_http_status 302
      expect(ActionMailer::Base.deliveries.size).to eq 1
    end
  end
end

