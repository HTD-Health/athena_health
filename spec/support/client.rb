def client_attributes
  {
    version: 'preview1',
    key: 'test_key',
    secret: 'test_secret',
    token: nil
  }
end

def client
  AthenaHealth::Client.new(client_attributes)
end
