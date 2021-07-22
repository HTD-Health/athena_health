def client_attributes
  {
    key: (ENV['ATHENA_TEST_KEY'] || 'test_key'),
    secret: (ENV['ATHENA_TEST_SECRET'] || 'test_secret'),
    token: (ENV['ATHENA_TEST_ACCESS_TOKEN'] || 'test_access_token')
  }
end

def client
  AthenaHealth::Client.new(**client_attributes)
end
