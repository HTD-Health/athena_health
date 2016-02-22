def client_attributes
  {
    version: 'preview1',
    key: 'test_key',
    secret: 'test_secret'
  }
end

def client
  AthenaHealth::Client.new(client_attributes)
end
