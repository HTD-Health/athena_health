def client_attributes
  {
    client_id: (ENV['ATHENA_TEST_CLIENT_ID'] || 'test_client_id'),
    secret: (ENV['ATHENA_TEST_SECRET'] || 'test_secret'),
    auth_token_hash: {
      'expires_at' => Time.now.to_i + 3600,
      'access_token' => ENV['ATHENA_TEST_ACCESS_TOKEN'] || 'test_access_token'
    }
  }
end

def client
  AthenaHealth::Client.new(**client_attributes)
end
