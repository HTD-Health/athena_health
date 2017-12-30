module AthenaHealth
  class BaseError                 < StandardError; end

  class ClientError               < BaseError; end
  class ServerError               < BaseError; end
  class UnknownError              < BaseError; end

  class UnauthorizedError         < ClientError; end
  class IncorrectPermissionsError < ClientError; end
  class ForbiddenError            < ClientError; end
  class NotFoundError             < ClientError; end

  class InternalServerError       < ServerError; end
  class ServiceUnavailableError   < ServerError; end
  class GatewayTimeoutError       < ServerError; end

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
      504 => GatewayTimeoutError,
    }

    def initialize(code:, message: '')
      @code = code
      @message = message
    end

    def render
      error = ERROR_TYPES[@code]
      error = UnknownError if error.nil?
      fail error, @message
    end
  end
end
