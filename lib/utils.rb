module Utils
  def background 
    Thread.new { yield }
  end

  def post(uri, payload)
    header = {'Content-Type': 'application/json'}
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri, header)
    request.body = payload.to_json
    http.request(request)
  end
end
