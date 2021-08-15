module GoogleOauthMockHelper
  def google_oauth_mock
    OmniAuth.config.test_mode = true
    OmniAuth.config.on_failure = Proc.new { |env|
      OmniAuth::FailureEndpoint.new(env).redirect_to_failure }

    OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
      provider: 'google_oauth2',
      uid: '123456',
      info:{
        name: "factory_user1",
        email: "user1@test.com",
      }
    })
  end
end
