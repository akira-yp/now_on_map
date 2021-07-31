require "rails_helper"

RSpec.describe "GoogleOauth", type: :system do
  include GoogleOauthMockHelper

  # let!(:user1){ FactoryBot.create(:user)}

  describe "googleによるsns認証" do
    before do
      OmniAuth.config.mock_auth[:google] = nil
      Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
      Rails.application.env_config['omniauth.auth'] = google_oauth_mock()
    end
    it "認証に成功する", js: true do
      visit new_user_session_path
      # post user_google_omniauth_callback_path
      click_link 'Googleでログイン'
      # byebug
      expect(page).to have_selector '.notice-content',visible: false ,text:"google アカウントによる認証に成功しました。"
    end
  end
end
