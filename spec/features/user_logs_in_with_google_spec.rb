require "rails_helper"

RSpec.feature "User logs in with Google" do
  before do
    mock_auth_hash
  end
  context "they use valid login credentials" do
    scenario "they are redirected to the homepage" do
      visit '/'
      expect(page.status_code).to eq 200
      click_link "Sign in with Google"
      expect(current_path).to eq "/"
      expect(page).to have_content "first"
      expect(page).to have_content "Logout"
    end
  end
end
