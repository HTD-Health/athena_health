module AthenaHealth
  class BaseError                 < StandardError; end
  
  class ClientError               < BaseError; end
  class ServerError               < BaseError; end
  
  class UnauthorizedError         < ClientError; end
  class IncorrectPermissionsError < ClientError; end
  class ForbiddenError            < ClientError; end
  class NotFoundError             < ClientError; end
  
  class InternalServerError       < ServerError; end
  class ServiceUnavailableError   < ServerError; end

  class ValidationError < BaseError
    attr_reader :details

    def initialize(details)
      @details = details
      super(details)
    end
  end


  class Error
    ERROR_TYPES = {
      401 => UnauthorizedError,
      402 => IncorrectPermissionsError,
      403 => ForbiddenError,
      404 => NotFoundError,
      500 => InternalServerError,
      503 => ServiceUnavailableError,
    }

    def initialize(code:)
      @code = code
    end

    def render
      fail ERROR_TYPES[@code]
    end
  end
end
