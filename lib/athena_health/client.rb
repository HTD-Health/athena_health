module AthenaHealth
  class Client
    def initialize(version:, key:, secret:)
      @api = AthenaHealth::Connection.new(version: version, key: key, secret: secret)
    end

    def all_practices
      response = @api.call(endpoint: '1/practiceinfo', method: :get)
      PracticeCollection.new(response)
    end
  end
end
