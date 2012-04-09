Before('@omniauth_test') do
  OmniAuth.config.test_mode = true

  # the symbol passed to mock_auth is the same as the name of the provider set up in the initializer
  OmniAuth.config.mock_auth[:google] = {
      "provider"=>"google",
      "uid"=>"http://xxxx.com/openid?id=118181138998978630963",
      "info"=>{"email"=>"markpeng@cs169.com", "first_name"=>"Mark", "last_name"=>"Peng", "name"=>"Mark Peng"}
  }
end

After('@omniauth_test') do
  OmniAuth.config.test_mode = false
end
