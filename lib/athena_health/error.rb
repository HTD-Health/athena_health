module AthenaHealth
  class BaseError                 < StandardError; end
  
  class UnauthorizedError         < BaseError; end
  class IncorrectPermissionsError < BaseError; end
  class ForbiddenError            < BaseError; end
  class NotFoundError             < BaseError; end
  class InternalServerError       < BaseError; end
  class ServiceUnavailableError   < BaseError; end

  class ValidationError < BaseError
    attr_reader :details

    def initialize(details)
      @details = details
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
