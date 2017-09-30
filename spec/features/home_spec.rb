require "rails_helper"

RSpec.describe "Home" do
  describe "Top Access" do
    scenario do
      visit root_path
      expect(page).to have_http_status 200
    end
  end
end
