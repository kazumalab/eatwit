require "rails_helper"

RSpec.describe HomeController do
  describe "#index" do
    before { get :index }

    it { expect(response).to have_http_status 200 }
  end
end

