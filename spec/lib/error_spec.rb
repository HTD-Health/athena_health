require 'spec_helper'

describe AthenaHealth::Error do
  let(:error) { AthenaHealth::Error.new(code: code) }

  describe '#render' do
    context 'when response code is 401' do
      let(:code) { 401 }

      it 'raise UnauthorizedError' do
        expect { error.render }.to raise_error(
          AthenaHealth::UnauthorizedError
        )
      end
    end

    context 'when response code is 402' do
      let(:code) { 402 }

      it 'raise IncorrectPermissionsError' do
        expect { error.render }.to raise_error(
          AthenaHealth::IncorrectPermissionsError
        )
      end
    end

    context 'when response code is 403' do
      let(:code) { 403 }

      it 'raise ForbiddenError' do
        expect { error.render }.to raise_error(
          AthenaHealth::ForbiddenError
        )
      end
    end

    context 'when response code is 404' do
      let(:code) { 404 }

      it 'raise NotFoundError' do
        expect { error.render }.to raise_error(
          AthenaHealth::NotFoundError
        )
      end
    end

    context 'when response code is 409' do
      let(:code) { 409 }

      it 'raise NotFoundError' do
        expect { error.render }.to raise_error(
          AthenaHealth::ConflictError
        )
      end
    end

    context 'when response code is 500' do
      let(:code) { 500 }

      it 'raise InternalServerError,' do
        expect { error.render }.to raise_error(
          AthenaHealth::InternalServerError
        )
      end
    end

    context 'when response code is 503' do
      let(:code) { 503 }

      it 'raise ServiceUnavailableError' do
        expect { error.render }.to raise_error(
          AthenaHealth::ServiceUnavailableError
        )
      end
    end
  end
end
