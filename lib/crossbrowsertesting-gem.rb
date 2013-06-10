require "base64"
require "net/http"
require "yajl"

class CBT
        
  API = "http://crossbrowsertesting.com/api/v2/screenshots"
  
  def initialize(username=nil, password=nil)
    raise "Expected username and password" unless username && password
    @username = username
    @password = password
  end
  
  def browsers
    make_post_request('browsers', {})
  end

  private
  
  def make_post_request(action, params)
    params[:format] = 'json'
    uri = URI("#{API}/#{action}")
    request = Net::HTTP::Post.new(uri)
    request.set_form_data(params)
    request.basic_auth(@username, @password)
    result = Net::HTTP.start(uri.hostname, uri.port) {|http|
      http.request(request)
    }
    parser = Yajl::Parser.new(:symbolize_keys => true)
    parser.parse(result.body)
  end
  
end #Client    