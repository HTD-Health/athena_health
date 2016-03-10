module AthenaHealth
  class UnauthorizedError         < StandardError; end
  class IncorrectPermissionsError < StandardError; end
  class ForbiddenError            < StandardError; end
  class NotFoundError             < StandardError; end
  class InternalServerError       < StandardError; end
  class ServiceUnavailableError   < StandardError; end

  class ValidationError < StandardError
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
