module HttpClient
  class Request
    class << self
      def post(url, body: nil, headers: nil)
        response = HTTParty.post(url, body: body, headers: headers)
        handle_response(response)
      end

      private

      def handle_response(response)
        case response.code
        when 200..299
          JSON.parse!(response.body, symbolize_names: true)
        when 400
          raise HttpClient::BadRequest
        when 401
          raise HttpClient::UnauthorizeRequest
        when 500..599
          raise HttpClient::ExternalServerError
        else
          raise HttpClient::RequestError, response.code
        end
      end
    end
  end

  class BadRequest < StandardError; end
  class ExternalServerError < StandardError; end
  class UnauthorizeRequest < StandardError; end
  class RequestError < StandardError; end
end