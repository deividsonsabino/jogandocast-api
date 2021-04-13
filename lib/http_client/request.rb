module HttpClient
  class Request
    class << self
      def post(url, body: nil, headers: nil)
        response = HTTParty.post(url, body: body, headers: headers)
        JSON.parse!(response.body, symbolize_names: true)
      end
    end
  end
end