module AthenaHealth
  class Error
    def initialize(code:)
      @code = code
    end

    def render
      fail errors[@code]
    end

    private

    def errors
      {
        400 => BadRequestError,
        401 => UnauthorizedError,
        402 => IncorrectPermissionsError,
        403 => ForbiddenError,
        404 => NotFoundError,
        409 => ConflictError,
        500 => InternalServerError,
        503 => ServiceUnavailableError,
      }
    end
  end

  class BadRequestError           < StandardError; end
  class UnauthorizedError         < StandardError; end
  class IncorrectPermissionsError < StandardError; end
  class ForbiddenError            < StandardError; end
  class NotFoundError             < StandardError; end
  class ConflictError             < StandardError; end
  class InternalServerError       < StandardError; end
  class ServiceUnavailableError   < StandardError; end
end
