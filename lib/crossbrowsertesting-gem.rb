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
    make_post_request('browsers')
  end
  
  def take_screenshot(params)
    make_post_request('run', params)
  end
  
  def status(test, version)
    response = make_post_request("#{test}/version/#{version}/status")
    response[:complete] == 1 ? true : false
  end

  def results(test, version)
    make_post_request("#{test}/version/#{version}/show")
  end

  private
  
  def make_post_request(action, params = {})
    params[:format] = 'json'
    uri = URI("#{API}/#{action}")
    request = Net::HTTP::Post.new(uri)
    request.set_form_data(params)
    request.basic_auth(@username, @password)
    result = Net::HTTP.start(uri.hostname, uri.port) {|http|
      http.request(request)
    }
    
    parser = Yajl::Parser.new(:symbolize_keys => true)
    begin
      output = parser.parse(result.body)[:response]
      if output[:error] != 0 
        raise GeneralError, output[:message]
      end
    rescue Yajl::ParseError
      raise GeneralError, result.body
    end
    
    output
  end

  class GeneralError < StandardError
  end
  
end #Client    
