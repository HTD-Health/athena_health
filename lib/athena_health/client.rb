module AthenaHealth
  class Client
    def initialize(version:, key:, secret:)
      @api = AthenaHealth::Connection.new(version: version, key: key, secret: secret)
    end

    def all_practices(params: {})
      response = @api.call(endpoint: '1/practiceinfo', method: :get, params: params)
      PracticeCollection.new(response)
    end

    def find_practice(practice_id:, params: {})
      response = @api.call(endpoint: "#{practice_id}/practiceinfo", method: :get, params: params)
      PracticeCollection.new(response).practiceinfo.first
    end

    def all_departments(practice_id:, params: {})
      response = @api.call(endpoint: "#{practice_id}/departments", method: :get, params: params)
      DepartmentCollection.new(response)
    end

    def find_department(practice_id:, department_id:, params: {})
      response = @api.call(endpoint: "#{practice_id}/departments/#{department_id}", method: :get, params: params)
      Department.new(response.first)
    end
  end
end
