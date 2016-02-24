module AthenaHealth
  class UnauthorizedError         < StandardError; end
  class IncorrectPermissionsError < StandardError; end
  class ForbiddenError            < StandardError; end
  class NotFoundError             < StandardError; end
  class ConflictError             < StandardError; end
  class InternalServerError       < StandardError; end
  class ServiceUnavailableError   < StandardError; end

  class Error
    ERROR_TYPES = {
      401 => UnauthorizedError,
      402 => IncorrectPermissionsError,
      403 => ForbiddenError,
      404 => NotFoundError,
      409 => ConflictError,
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
